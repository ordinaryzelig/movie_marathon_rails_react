@Formatter =
  formatTime: (datetime) ->
    hours = @formatHour(datetime.getHours())
    minutes = @formatMinutes(datetime.getMinutes())
    "#{hours}:#{minutes}"

  formatHour: (hours) ->
    if hours > 12  then return hours % 12
    if hours == 0 then return 12
    hours

  formatMinutes: (minutes) ->
    if minutes < 10
      "0#{minutes}"
    else
      '' + minutes

  formatMeridiem: (hours) ->
    if hours >= 12
      'p.m.'
    else
      'a.m.'

  formatRuntime: (minutes) ->
    if minutes
      hours = Math.floor(minutes / 60)
      mins = minutes % 60
      "#{hours}h #{mins}m"
    else
      '?'

  # why is this so fucking difficult?
  months: [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ]
  weekdays: [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ]

  formatDate: (date) ->
    "#{@weekdays[date.getDay()]} #{@months[date.getMonth() + 1]} #{date.getDate()}"

  dateFormats: {
    db: new Intl.DateTimeFormat('en-US', year: 'numeric', month: 'numeric', day: 'numeric')
  }

  formatDateDB: (date) ->
    @dateFormats.db.format(date)
