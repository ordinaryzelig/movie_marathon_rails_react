class @ShowtimesList extends React.Component
  render: ->
    showtimeComponents = []
    for showtime in this.props.showtimes
      if showtime.movie.checked
        key = "#{showtime.movie.id}-#{showtime.datetime}"
        showtimeComponents.push(
          `<Showtime
            key={key}
            showtime={showtime}
            datetimeRanges={this.props.datetimeRanges}
            onShowtimeClick={this.props.onShowtimeClick}
            conflictsWithSelected={this.props.showtimes.conflictsWithSelected(showtime)}
          />`
        )

    `<div className="row">
      {showtimeComponents}
    </div>`
