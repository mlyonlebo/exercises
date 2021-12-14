class Clock
  attr_reader :time_in_minutes

  def initialize(hours, minutes)
    minutes += (hours * 60)
    @time_in_minutes = minutes
  end

  def time_in_minutes=(minutes)
    @time_in_minutes = minutes
    @time_in_minutes += 1440 if @time_in_minutes < 0
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def to_s
    hours, minutes = time_in_minutes.divmod(60)
    hours = hours.divmod(24)[1]
    "#{format("%02d", hours)}:#{format("%02d", minutes)}"
  end

  def +(minutes)
    self.time_in_minutes += minutes
    self
  end

  def -(minutes)
    self.time_in_minutes -= minutes
    self
  end

  def ==(other)
    time_in_minutes == other.time_in_minutes
  end
end

#p Clock.at(10)
# puts Clock.at(10, 37)
# puts Clock.at(26, 13)