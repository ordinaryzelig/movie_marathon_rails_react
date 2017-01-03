class @Showtime extends React.Component
  render: ->
    `<div
      className={'showtime ' + this.selectableClass()}
      style={{marginLeft: this.marginLeft(), width: this.runtimeWidth()}}
      onClick={() => this.props.onShowtimeClick(this.props.showtime)}
    >
      <div className="datetime start">{Formatter.formatTime(this.props.showtime.datetime)}</div>
      <div className="datetime end">{Formatter.formatTime(this.props.showtime.endTime)}</div>
      <div
        className="title"
        title={this.props.showtime.movie.title}
      >
        {this.props.showtime.movie.title}
      </div>
    </div>`

  selectableClass: ->
    if @props.showtime.selected
      return 'selected'

    if !@props.showtime.movie.selected && @props.showtime.withinRange && !@props.conflictsWithSelected
      'selectable'
    else
      'unselectable'

  marginLeft: ->
    percent =
      (@props.showtime.datetime - @props.datetimeRanges.floor) /
      (@props.datetimeRanges.ceiling - @props.datetimeRanges.floor) *
      100
    "#{percent}%"

  runtimeWidth: ->
    spanMinutes = Datetime.minutesBetween(@props.datetimeRanges.floor, @props.datetimeRanges.ceiling)
    percent = (@props.showtime.movie.runtime / spanMinutes) * 100
    "#{percent}%"
