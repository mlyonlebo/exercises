class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(maximum)
    SumOfMultiples.new(3, 5).to(maximum)
  end

  def generate_multiples(n, maximum)
    multiples = []
    (1..).each do |factor|
      multiple = factor * n
      break if multiple >= maximum
      multiples << multiple
    end
    multiples
  end

  def to(maximum)
    all_multiples = [] 
    multiples.each do |n|
      all_multiples += generate_multiples(n, maximum)
    end
    all_multiples.uniq.sum
  end
end
