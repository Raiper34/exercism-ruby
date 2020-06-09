class Clock

  HOURS_MAX = 24
  MINUTE_MAX = 60
  UNIT_MAX = 1440

  def initialize(minute: 0, hour: 0)
    @minute = (minute + (hour * MINUTE_MAX)) % UNIT_MAX
  end

  def minute
    @minute
  end

  def hour
    minute / MINUTE_MAX
  end

  def to_s
    "%02d:%02d" % [normalize(hour, HOURS_MAX), normalize(minute, MINUTE_MAX)]
  end

  def ==(clock2)
    minute == clock2.minute
  end

  def -(clock2)
    Clock.new(minute: minute - clock2.minute)
  end

  def +(clock2)
    Clock.new(minute: minute + clock2.minute)
  end

  private

  def normalize(time, max)
    time % max
  end

end
