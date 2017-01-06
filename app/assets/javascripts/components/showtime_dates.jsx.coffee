class @ShowtimeDates extends React.Component
  render: ->
    nums = @props.date.split('-').map((n) -> +n)
    startDate = new Date(nums[0], nums[1] - 1, nums[2]) # Not sure why nums... doesn't work.

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
