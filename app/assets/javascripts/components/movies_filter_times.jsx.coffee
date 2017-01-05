class @MoviesFilterTimes extends React.Component
  constructor: (props) ->
    super props

    @floorTime = props.datetimeRanges.floor
    @ceilingTime = props.datetimeRanges.ceiling

    @max = (@ceilingTime - @floorTime) / 60000

    @formatTip = @formatTip.bind(this)
    @onChange = @onChange.bind(this)

  render: ->
    `<div id="movies-filter-times">
      <Rcslider
        min={0}
        max={this.max}
        step={15}
        tipFormatter={this.formatTip}
        range
        marks={this.marks()}
        defaultValue={[0, this.max]}
        onChange={this.onChange}
      />
    </div>`

  onChange: (range) ->
    minDatetime = Datetime.addMinutes(@floorTime, range[0])
    maxDatetime = Datetime.addMinutes(@floorTime, range[1])
    @props.onFilterTimeChange([minDatetime, maxDatetime])

  formatTip: (minutes) ->
    adjusted = Datetime.addMinutes(@floorTime, minutes)
    Formatter.formatTime(adjusted)

  marks: ->
    marks = {}
    numHourIntervals = Math.floor((@props.datetimeRanges.ceiling - @props.datetimeRanges.floor) / 60000 / 60)
    for hours in [0..numHourIntervals]
      minutes = hours * 60
      marks[minutes] = Formatter.formatTime(Datetime.addMinutes(@props.datetimeRanges.floor, minutes))
    marks
