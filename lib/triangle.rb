require "pry"

class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid?
    if @side1 <= 0 || @side2 <= 0 || @side3 <=0
      return false
    elsif (@side1 + @side2) <= @side3 || (@side2 + @side3) <= @side1 || (@side3 + @side1) <= @side2
      return false
    else
      return true
    end
  end

  def kind
    if self.valid?
      if @side1 == @side2 && @side1 == @side3 && @side2 == @side3
        return :equilateral
      elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
        return :isosceles
      elsif @side1 != @side2 && @side1 != @side3 && @side2 != @side3
        return :scalene
      end
    else
      # begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.message
      # end
    end
  end
end

class TriangleError < StandardError
  def message
    "The triangle is invalid."
  end
end
