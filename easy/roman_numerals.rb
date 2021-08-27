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

RomanNumeral#to_roman
- Initialize empty string to hold results
- Get a copy of num to work with (so we don't lose the value?)
- Iterate through the conversions hash
  - Loop:
    - Is the current key less or = to num?
      - Add the associated value to the results string
      - Subtract the key from num
      - Break if the current key > num
  - return string if num = 0
- return the results string
=end

class RomanNumeral
  CONVERSIONS = { 1000=>"M", 900=>"CM", 500=>"D", 400=>"CD", 100=>"C",
                  90=>"XC", 50=>"L", 40=>"XL", 10=>"X", 9=>"IX", 5=>"V",
                  4=>"IV", 1=>"I" }

  def initialize(num)
    @number = num
  end

  def to_roman
    roman_numeral = ''
    num = @number.dup

    CONVERSIONS.each do |decimal, letters|
      loop do
        break if decimal > num
        roman_numeral << letters
        num -= decimal
      end
      return roman_numeral if num == 0
    end

    roman_numeral
  end
end
