=begin
two methods:

1. initialize
sets a random name attribute for the robot object (ie. RX857)
can't share a name with any preexisting robots

2. reset
changes the name attribute


=end

class Robot
  attr_accessor :name
  
  @@unavailable_names = []

  def self.unavailable_names
    @@unavailable_names
  end

  def initialize
    @name = ''
    assign_name
    @@unavailable_names << @name
  end

  def reset
    assign_name
    @@unavailable_names << @name
  end

  private 

  def assign_name
    loop do
      self.name = generate_random_name
      break unless @@unavailable_names.include?(@name)
    end
  end

  def generate_random_name
    new_name = ''
    2.times do 
      new_name += ('A'..'Z').to_a.sample
    end
    3.times do
      new_name += ('0'..'9').to_a.sample
    end
    new_name
  end
end

# robot_a = Robot.new
# puts robot_a.name
# robot_b = Robot.new
# puts robot_b.name
# p Robot.unavailable_names
# robot_b.reset
# puts robot_b.name
# p Robot.unavailable_names
