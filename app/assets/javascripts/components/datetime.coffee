@Datetime =
  addMinutes: (datetime, minutes) ->
    return new Date(datetime.getTime() + minutes*60000)

  floor: (datetime) ->
    return this.addMinutes(datetime, -datetime.getMinutes())

  ceiling: (datetime) ->
    return this.addMinutes(datetime, 60 - datetime.getMinutes())

  minutesBetween: (a, b) ->
    (b - a) / 60000
