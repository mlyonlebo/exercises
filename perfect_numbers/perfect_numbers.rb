=begin
p
given a number, classify it as perfect, abundant or deficient
according to whether the numbers factors (other than itself) sum to greater than the number
*raise StandardError if given number is negative

a
helper method that finds all the factors of a given number
  iterate from 2 to (number - 2)
  if divisible, add to collection of factors
  return collection

main method that classifies number using the return value of the helper method

=end


class PerfectNumber

  def self.factors(number)
    factors = [1]
    ceiling = (number/2)
    divisor = 2
    while divisor < ceiling
      factor, remainder = number.divmod(divisor)
      if remainder == 0
        factors += [divisor, factor]
        ceiling = factor
      end
      divisor += 1
    end 
    factors
  end

  def self.classify(number)
    raise StandardError.new if number < 1 
    sum_of_factors = factors(number).sum
    if number == sum_of_factors
      'perfect'
    elsif number < sum_of_factors
      'abundant'
    elsif number > sum_of_factors
      'deficient'
    end
  end
end