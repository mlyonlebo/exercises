  #given an integer and an index representing its digits place,
  #return a string representation of its roman numeral
  #based on the ones and fives
  #2 and 3 are multiples of 1
  #4 is 5 minus 1
  #6, 7, 8 is 5 plus 1, 5 plus 1 plus 1, 5 plus 1 plus 1 plus 1
  #9 is 1[idx] + 1[idx + 1]

  #def numeral_builder(integer, idx)


# class RomanNumeral
#   attr_reader :decimal_value

#   NUMERALS = {
#     1 => ['I', 'X', 'C', 'M'],
#     2 => ['II', 'XX', 'CC', 'MM'],
#     3 => ['III', 'XXX', 'CCC', 'MMM'],
#     4 => ['IV', 'XL', 'CD'],
#     5 => ['V', 'L', 'D'],
#     6 => ['VI', 'LX', 'DC'],
#     7 => ['VII', 'LXX', 'DCC'],
#     8 => ['VIII', 'LXXX', 'DCCC'],
#     9 => ['IX', 'XC', 'CM']
#   }
#   def initialize(decimal_value)
#     @decimal_value = decimal_value
#   end

#   def to_roman
#     roman_num = []
#     ones, tens, hundreds, thousands = decimal_value.digits
#     [ones, tens, hundreds, thousands].each_with_index do |digit, idx|
#       unless digit.nil? || digit.zero?
#         roman_num.unshift(NUMERALS[digit][idx])
#       end
#     end
#     roman_num.join
#   end
# end

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_numeral = ''
    decimal = number
    ROMAN_NUMERALS.each do |key, value|
      factor, remainder = decimal.divmod(value)
      if factor > 0
        roman_numeral << key
      end
      decimal = remainder
    end
    roman_numeral
  end
end

puts RomanNumeral.new(1990).to_roman