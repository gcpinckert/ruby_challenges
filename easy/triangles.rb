=begin
PROBLEM:
- Write a program to see if a triangle is equilateral, isosceles, or scalene
- Triangle:
  - all sides must have length that is > 0
  - sum of lengths of any two sides are greater than the length of third side
- Equilateral
  - all three sides are equal
- Isosceles
  - two sides are equal
- Scalene
  - all three sides have different lengths

EXAMPLES/TEST CASES:
- We should create a Triangle class
  - Triangle.new takes three arguments, all numbers, the length of each side
  - Can accept either integers or floats
  - Passing a 0 should raise an argument error
  - Passing a negative num should raise an argument error
  - Passing arguments not adhering to the 2nd rule of triangles raises error
- Triangle#kind method
  - Returns a string representing the type of triangle
  - i.e. 'isosceles', 'equilateral', 'scalene'
- helper methods?

DATA STRUCTURE:
- Input: 3 numbers, representing length of each side
- Output: string (describes type of triangle)
- Triangle sides can be stored in an Array

ALGORITHM:
Triangle::new
  - Assign sides to instance variable @sides -> an array
  - Check to see if valid_triangle? if not, raise ArgumentError

Triangle#valid_triangle? -> private method?
 - all sides in @sides are > 0?
 - sum of any two sides is > than third side?
  - side1 + side2 > side3
  - side1 + side3 > side2
  - side2 + side3 > side1

Triangle#kind method
 - Remove all non-unique items from the @sides array (do not mutate)
 - Get the size of the resulting array
 - if size == 1, return 'equilateral'
 - if size == 2, return 'isosceles'
 - if size == 3, return 'scalene'
=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless valid_triangle?
  end

  def kind
    case @sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  private

  def valid_triangle?
    positive_sides? && valid_lengths?
  end

  def positive_sides?
    @sides.all? { |sides| sides > 0 }
  end

  def valid_lengths?
    @sides[0] + @sides[1] > @sides[2] &&
      @sides[1] + @sides[2] > @sides[0] &&
      @sides[2] + @sides[0] > @sides[1]
  end
end
