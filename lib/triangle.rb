class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def positive_num?
    [side1, side2, side3].all?(&:positive?)
  end

  def valid_sides?
    side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end

  def kind
    valid_triangle
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  def valid_triangle
    raise TriangleError unless valid_sides? && positive_num?
  end

  class TriangleError < StandardError
  end
end
