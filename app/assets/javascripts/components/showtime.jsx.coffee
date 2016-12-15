class @Showtime extends React.Component
  render: ->
    `<div
      className={'showtime ' + this.selectableClass()}
      style={{marginLeft: this.marginLeft(), width: this.runtimeWidth()}}
      onClick={() => this.props.onShowtimeSelect(this.props.showtime)}
    >
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
    percent = (@props.showtime.runtime / spanMinutes) * 100
    "#{percent}%"
