class Octal
  attr_reader :value

  def initialize(value)
    @value = octal_validator(value) 
  end

  def octal_validator(num)
    num.match(/^[0-7]+$/) ? num.to_i : 0
  end

  def to_decimal
    octal_num = 0
    value.digits.each_with_index do |digit, idx|
      octal_num += (digit * (8**idx))
    end
    octal_num
  end
end


