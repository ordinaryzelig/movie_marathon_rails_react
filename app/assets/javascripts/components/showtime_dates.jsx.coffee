class @ShowtimeDates extends React.Component
  render: ->
    startDate = new Date(@props.date)

    dates = [0..10].map (offset) ->
      date = new Date(startDate.getTime())
      date.setDate(date.getDate() + offset)
      date

    lis = dates.map (date) ->
      href = "?date=#{Formatter.formatDateDB(date)}"
      `<li key={date}>
        <a href={href}>{Formatter.formatDate(date)}</a>
      </li>`

    `<ul>{lis}</ul>`
