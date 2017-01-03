class @App extends React.Component
  constructor: (props) ->
    super(props)

    @initMovies(props.movies)

    @state = {
      movies: props.movies,
      showtimes: @extractShowtimes(props.movies),
    }
    @datetimeRanges = @calculateDatetimeRanges(@state.showtimes)
    @onMovieCheckboxToggle = @onMovieCheckboxToggle.bind(this)
    @onFilterTimeChange = @onFilterTimeChange.bind(this)
    @onShowtimeClick = @onShowtimeClick.bind(this)

  render: ->
    `<div>
      <MoviesFilterCheckboxes
        movies={this.state.movies}
        onMovieCheckboxToggle={this.onMovieCheckboxToggle}
      />
      <ShowtimesList
        showtimes={this.state.showtimes}
        datetimeRanges={this.datetimeRanges}
        onShowtimeClick={this.onShowtimeClick}
      />
    </div>`

  onMovieCheckboxToggle: (changedMovie, checked) ->
    newMovies = @state.movies.slice()
    for movie in newMovies
      if movie == changedMovie
        movie.checked = checked
    @setState({movies: newMovies})

  onFilterTimeChange: (range) ->
    newMovies = @state.movies.map (movie) =>
      movie.showtimes = movie.showtimes.map (showtime) =>
        startsWithinRange = range[0] <= showtime.datetime
        endsWithinRange = showtime.endTime <= range[1]
        showtime.withinRange = startsWithinRange && endsWithinRange
        showtime
      movie
    @setState({movies: newMovies})

  onShowtimeClick: (showtime) ->
    if showtime.selected
      @unmarkSelected(showtime)
      return
    if !showtime.selected &&
       !showtime.movie.selected &&
       !@state.showtimes.conflictsWithSelected(showtime) &&
       showtime.withinRange
      @markSelected(showtime)

  #########
  # Helpers

  initMovies: (movies) ->
    for movie in movies
      movie.checked = false
      movie.runtime ||= 120
      for showtime in movie.showtimes
        showtime.movie = movie
        showtime.datetime = new Date(showtime.datetime)
        showtime.withinRange = true
        showtime.endTime = Datetime.addMinutes(showtime.datetime, showtime.movie.runtime)

  extractShowtimes: (movies) ->
    showtimes = []
    for movie in movies
      showtimes = showtimes.concat(movie.showtimes)
    showtimes.sort(@showtimeSorter)
    @addShowtimeFunctions(showtimes)
    showtimes

  calculateDatetimeRanges: (showtimes) ->
    startTimes = showtimes
      .map( (showtime) -> return showtime.datetime )
      .sort()
    endTimes = showtimes
      .map( (showtime) -> return showtime.endTime )
      .sort()
    {
      floor:   Datetime.floor(startTimes[0]),
      ceiling: Datetime.ceiling(endTimes[endTimes.length - 1])
    }

  markSelected: (clickedShowtime) ->
    @setShowtimeState clickedShowtime, (newShowtime) ->
      newShowtime.selected = true
      newShowtime.movie.selected = true

  unmarkSelected: (clickedShowtime) ->
    @setShowtimeState clickedShowtime, (newShowtime) ->
      newShowtime.selected = false
      newShowtime.movie.selected = false

  setShowtimeState: (oldShowtime, newShowtimeCallback) ->
    newShowtimes = @state.showtimes.slice()
    for newShowtime in newShowtimes
      newShowtimeCallback(newShowtime) if newShowtime == oldShowtime
    @addShowtimeFunctions(newShowtimes)
    @calculateLayovers(newShowtimes.selected())
    @setState({showtimes: newShowtimes})

  showtimeSorter: (a, b) ->
    return -1 if a.datetime < b.datetime
    return  1 if a.datetime > b.datetime
    0

  addShowtimeFunctions: (showtimes) ->
    showtimes.selected = ->
      @filter (showtime) -> showtime.selected

    showtimes.conflictsWithSelected = (showtime) ->
      for selected in showtimes.selected()
        conflicts =
          (
            selected.datetime <= showtime.datetime &&
            showtime.datetime <= selected.endTime
          ) ||
          (
            showtime.endTime >= selected.datetime &&
            showtime.endTime <= selected.endTime
          )
        return true if conflicts
      false

  calculateLayovers: (showtimes) ->
    for showtime, idx in showtimes.slice(0, showtimes.length - 1)
      nextShowtime = showtimes[idx + 1]
      showtime.layoverMinutes = Datetime.minutesBetween(showtime.endTime, nextShowtime.datetime)
