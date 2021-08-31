=begin
PROBLEM:
- Implement octal to decimal conversion.
- Input: octal number as a string Output: decimal number
- Invalid input should be treated as Octal 0
- Do not use any built in or library conversion methods.

OCTAL NUMBERS:
Base 10 => 233 = (2 * 10^2) + (3 * 10^1) + (3 * 10^0)
Base 8 does the same thing but uses base 8 instead of 10
233 => (2 * 8^2) + (3 * 8^1) + (3 * 8^0)
    => 2 * 64    + 3 * 8     + 3 * 1
    => 128       + 24        + 3
    => 155
A valid octal number does not include the digits 8 or 9 (only 0-7)

EXAMPLES / TEST CASES:
Create a class Octal
- Initialization takes one argument, a string of digits representing octal num
- Can accept invalid strings (not all digits), does not raise error


Octal#to_decimal
- Returns an integer representing the number passed as argument in base 10
- If the string argument was not a valid octal number, returns 0
  - invalid octal number could include characters
  - may also be a number that could not exist as octal (i.e. 9 or 6789)
  - leading 0's are valid if the number following them is valid

DATA STRUCTURES
- Input: String representing octal number (may be invalid)
- Output: Integer representing decimal number of octal num string
  - 0 if string passed was invalid
- Internally: Convert digits in string to an array of nums to iterate

ALGORITHM:
Octal#initialize
- takes string argument and saves to instance variable @octal_num

Octal#invalid_octal?
- Checks to see if @octal_num includes any letters or the digits 8 or 9
- Return true if either matches occur

Octal#to_decimal
- Return 0 if @octal_num is an invalid_octal?
- Convert the string to an integer
- Covert the integer to an array of digits (this will be reversed)
- Iterate over the array for transformation, with index
  - Multiply the current element by 8 ^ index
- Sum the array once transformation is complete, return the sum
=end

class Octal
  attr_reader :octal_num

  def initialize(str)
    @octal_num = str
  end

  def to_decimal
    return 0 if invalid_octal?
    octal_num.to_i.digits.map.with_index do |digit, index|
      digit * (8**index)
    end.sum
  end

  private

  def invalid_octal?
    octal_num =~ /[^0-7]/
  end
end