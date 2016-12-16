class @MoviesFilterCheckboxes extends React.Component
  render: ->
    checkboxes =
      @props.movies.map (movie) =>
        key = "#{movie.title} #{movie.id}"
        onChange = (event) =>
          @props.onMovieCheckboxToggle(movie, event.target.checked)
        `<li key={key} className={movie.checked ? 'checked' : ''}>
          <label>
            <input type="checkbox" checked={movie.checked} onChange={onChange} />
            <span className="title">{movie.title}</span>
            <span className="runtime">({Formatter.formatRuntime(movie.runtime)})</span>
          </label>
        </li>`

    `<ul id="movies-filter">
      {checkboxes}
    </ul>`
