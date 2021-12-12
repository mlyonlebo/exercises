class Triangle
  def initialize(side1, side2, side3)
    raise ArgumentError.new("Not a valid triangle.") unless validate_triangle(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def validate_triangle(side1, side2, side3)
    all_positive(side1, side2, side3) && valid_lengths(side1, side2, side3)
  end

  def all_positive(side1, side2, side3)
    (side1 > 0) && (side2 > 0) && (side3 > 0)
  end

  def valid_lengths(side1, side2, side3)
    (side1 + side2 > side3) && (side2 + side3 > side1) && (side1 + side3 > side2)
  end

  def kind
    if @side1 == @side2 && @side2 == @side3
      'equilateral'
    elsif @side1 != @side2 && @side2 != @side3 && @side3 != @side1
      'scalene'
    elsif (@side1 == @side2) ^ (@side1 == @side3) ^ (@side2 == @side3)
      'isosceles'
    end
  end
end