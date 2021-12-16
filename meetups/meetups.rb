require 'date'

class Meetup
  attr_reader :month
  attr_accessor :date
  
  NTH_DAY = {
              'first' => 1, 
              'second' => 2, 
              'third' => 3, 
              'fourth' => 4, 
              'fifth' => 5, 
             }.freeze

  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.new(year, month)
  end

  def day(day, specification)
    specification = specification.downcase
    n = NTH_DAY[specification]
    update_date(day, n) if n
    update_date_to_teenth(day) if specification == 'teenth'
    update_date_to_last(day) if specification == 'last'
    date.month == month ? date : nil
  end

  def update_date(day, n)
    day_count = 0
    loop do
      day_count += 1 if date.send(reformat_as_method_name(day))
      break if day_count == n
      self.date += 1
    end
  end

  def update_date_to_teenth(day)
    self.date += 12
    update_date(day, 1)
  end

  def update_date_to_last(day)
    last_day = nil
    loop do
      last_day = date if date.send(reformat_as_method_name(day))
      self.date += 1
      break if date.month != month
    end
    self.date = last_day
  end

  def reformat_as_method_name(str)
    str.downcase + '?'
  end
end