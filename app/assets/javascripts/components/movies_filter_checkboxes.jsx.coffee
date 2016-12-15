class @MoviesFilterCheckboxes extends React.Component
  render: ->
    checkboxes =
      @props.movies.map (movie) =>
        `<li key={'${movie.title} ${movie.id}'} className={movie.checked ? 'checked' : ''}>
          <label>
            <input type="checkbox" checked={movie.checked} onChange={(event) => this.props.onMovieCheckboxToggle(movie, event.target.checked)} />
            <span className="title">{movie.title}</span> <span className="runtime">({Formatter.formatRuntime(movie.runtime)})</span>
          </label>
        </li>`

    `<ul id="movies-filter">
      {checkboxes}
    </ul>`
