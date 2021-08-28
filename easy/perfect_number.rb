=begin
PROBLEM:
Write a program that can tell if a number is perfect, abundant, or deficient

Terms:
Divisors = numbers that can be evenly divided into a target number
Aliquot sum = the sum of divisors for a given number
Perfect numbers = Aliquot sum is equal to the number
Abundant numbers = Aliquot sum is greater than the number
Deficient numbers = Aliquot sum is less than original number

EXAMPLES AND TEST CASES:
- 6 -> Perfect number -> Divisors = 1 + 2 + 3 = 6 (6 == 6)
- 28 -> Perfect number -> Divisors = 1 + 2 + 4 + 7 + 14 = 28 (28 == 28)
- 15 -> Deficient number -> Divisors = 1 + 3 + 5 = 9 (9 < 15)
- 24 -> Abundant number -> Divisors = 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 (36 > 28)
- Prime numbers (7, 13, etc) are always deficient since their only divisor is 1

Define a PerfectNumber class
Define a PerfectNumber::classify method that takes a single argument
If the argument passed is not a positive integer, it should raise a StandardError
PerfectNumber::classify returns a string representing the type of number

DATA STRUCTURES:
Input: a positive integer (raise error if negative)
Output: a string, representing type of number passed as argument
Internal: Range to find divisors? Array to store factors?

ALGORITHM:
PerfectNumber::classify(num)
- raise StandardError unless the num passed as argument is positive
- get the aliquot_sum
- compare aliquot_sum with num passed as argument to determine the type

PerfectNumber::aliquot_sum(num)
- Initialize a sum to 0
- Iterate from 1 to one less than the num, tracking iteration (i)
  - If the target num is evenly divisible by the current i:
    - add the current i to the sum
- return the sum
=end

class PerfectNumber
  def self.classify(num)
    raise StandardError unless num.positive?
    case (aliquot_sum(num) <=> num)
    when -1 then 'deficient'
    when 0 then 'perfect'
    when 1 then 'abundant'
    end
  end

  def self.aliquot_sum(num)
    sum = 0
    (1...num).each do |i|
      sum += i if num % i == 0
    end
    sum
  end
end
