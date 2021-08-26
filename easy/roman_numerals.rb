=begin
PROBLEM:
Write a program that converts modern decimal numbers into Roman numerals

Roman Numerals:
I - 1
V - 5
X - 10
L - 50
C - 100
D - 500
M - 1000
- Written by expressing each digit separately going from left to the right
- There is no 0 so you can skip it
  ex. 1990 -> M(1000) + CM(900) + XC(90) -> MCMXC
  ex. 2008 -> MM(2000) + VIII(8) -> MMVIII
- Note that values indicating 4 or 9 are written by subtracting from 5 or 10
  ex. 1:I, 2:II, 3:III, 4:IV, 5:V, 6:VI, 7:VII, 8:VIII, 9:IX, 10:X 
  ex. 10:X, 20:XX, 30:XXX, 40:XL, 50:L, 60:LX, 70:LXX, 80:LXXX, 90:XC, 100:C
- Don't worry about numbers over 3,000

EXAMPLES/TEST CASES:
RomanNumeral class
- Instances are initialized with 1 argument, an integer
- Define a RomanNumeral#to_roman method, which should return a string containing
  the integer provided as argument as a roman numeral

DATA STRUCTURES:
Input: an integer
Output: a string (representing that int as a roman numeral)
Internally: a hash for digit conversion?, an array to hold "place values"?

ALGORITHM:
Initialize Conversions Constant:
- a hash in which the key is the integer and the value is the roman numeral
- doesn't need every number, but needs to have all digits with place value?

RomanNumeral::new(integer)
- assign the integer passed as argument to an instance variable
- generate an array of place values, i.e. if 1999 -> [1000, 900, 90, 9]

RomanNumeral#place_values
- get an array of all the digits in the passed in number
  - note that if we use Integer#digits this will come out in reverse
- iterate over the array, with index, for transformation
  - convert the current int to a string
  - concatenate the string '0' multiplied by the current index with the result
  - convert the resulting string back into an integer
- get rid of any zeros in the resulting transformed array (i.e. 000 not 100)
- reverse it and return the result

RomanNumeral#to_roman
- Iterate over the array of place values, transforming
  - if the conversions hash has the key of the current num
    - replace it with the associated value
  - otherwise
    - initialize an empty string
    - find the key for the next lowest decimal num (i.e. if 3, it will be 1)
    - add the associated value to the string
    - subtract the key from the num
    - keep looping through the above steps until num = 0
- join the transformed array into a string and return
=end

class RomanNumeral
  CONVERSIONS = { 1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X',
                  40 => 'XL', 50 => 'L', 90 => 'XC', 100 => 'C',
                  400 => 'CD', 500 => 'D', 900 => 'CM', 1000 => 'M' }

  attr_reader :number, :digits

  def initialize(num)
    @number = num
    @digits = place_values
  end

  def place_values
    arr = number.digits.map.with_index { |n, i| (n.to_s + ('0' * i)).to_i }
    arr.delete(0)
    arr.reverse
  end

  def to_roman
    digits.map do |num|
      if CONVERSIONS.has_key?(num)
        CONVERSIONS[num]
      else
        calc_roman_num(num)
      end
    end.join
  end

  def calc_roman_num(num)
    str = ''
    key = CONVERSIONS.keys.select { |int| int < num }.max

    loop do
      str << CONVERSIONS[key]
      num -= key
      break if num == 0
    end

    str
  end
end

# Note: This currently takes too long to test. Rework the algo.