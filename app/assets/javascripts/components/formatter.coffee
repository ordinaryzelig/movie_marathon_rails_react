@Formatter =
  formatTime: (datetime) ->
    hours = @formatHour(datetime.getHours())
    minutes = @formatMinutes(datetime.getMinutes())
    ampm = @formatMeridiem(datetime.getHours())
    "#{hours}:#{minutes} #{ampm}"

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
