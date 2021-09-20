=begin
PROBLEM:
- Given a string of digits, return all the possible consecutive numbers series
  of a specified length in that string.
- Raise an error if the specified length is larger than that of the string

EXAMPLES:
"01234", 3
- 012
- 123
- 234

"01234", 4
-0123
-1234

TEST CASES:
Define a Series class
Series#initialize
- Takes a single argument, a string of digits

Series#slices
- Takes a single argument, the specified length of numbers to be provided
- Returns a nested array of numbers
- Each subarray represents the consecutive digits in the "slice"
  i.e. "01234", 4 -> [[0, 1, 2, 3], [1, 2, 3, 4]]
- Should raise an argument error if the argument is larger than the length of
  the string of digits encapsulated within the calling instance

DATA STRUCTURES:
Input: a string of digits and an integer representing "slice" length
Output: a nested array, each subarray has the elements that are digits in the slice
  - subarray represents digits as integers not strings
Internally: an array to iterate over digits

ALGORITHM:
Series#initialize
- Convert the string of digits to an array of integers
- Save the resulting variable in an instance variable @digits
- Save the length of this array in another instance variable, @max_size

Series#slices
- Raise an ArgumentError if the argument provided is larger than @max_size
- Initialize a slices empty array to hold the results
- Iterate over the digits array, getting the consecutive digits in the specified
  length
- Add the current slice to the slices array
- Return the slices array
=end

class Series
  def initialize(digits)
    @digits = convert_digits(digits)
    @max_size = digits.size
  end

  def slices(length)
    raise ArgumentError if length > max_size

    digits.each_cons(length).to_a
  end

  private

  attr_reader :digits, :max_size

  def convert_digits(string)
    string.chars.map { |char| char.to_i }
  end
end
