=begin
PROBLEM:
Find the sum of all the multiples of numbers in a given set that are less
than another given number. 
-> two arguments, max_num and set_of_nums
-> Find all the multiples in set_of_nums that are less than max_num
-> Sum the multiples
-> If a set of numbers is not given, use a default [3, 5]

EXAMPLES:
max_num = 20, set = [3, 5]
3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 = 78

TEST CASES:
Define a class SumOfMultiples
- Class method ::to
  - Takes a single argument, the max_num
  - Uses default set of [3, 5] to calculate sum of multiples
- #initialize method
  - Takes an arbitrary amount of arguments, representing numbers in the set_of_nums
- Instance method #to
  - Takes a single argument, the max num
  - Uses the set of nums defined in the calling instance to calculate sum of
    multiples

DATA STRUCTURES:
Input: an arbitrary number of integers (splat operator to transform to array)
       plus an integer representing max_num
Output: an integer, representing sum of multiples
Internally: an array to hold set of nums, an array to hold set of multiples?

ALGORITHM:
SumOfMultiples#initialize
- Takes an arbitrary number of arguments
- Convert all the argument values assigned into an array
- Assign the array to the instance variable @set
- If no arguments are provided, use the default set of [3, 5]
- Initialize an instance variable multiples to an empty array

SumOfMultiples#to
- Takes a single argument, the max num
- Iterate through the nums in @set
  - Initialize a counter to 1
  - Iterate a loop
    - Initialize current_multiple to current num * counter
    - break the loop if current multiple >= max_num
    - Add the current_multiple to the @multiples array
    - Increment the counter by 1
- Return the sum of all the values in @multiples

SumOfMultiples::to
- Takes a single argument, the max num
- Initialize a new instance of SumOfMultiples, with no arguments
- Return the value of #to(max_num) for this "default" set
=end

class SumOfMultiples
  attr_reader :set, :multiples

  def initialize(*numbers)
    @set = numbers.empty? ? [3, 5] : numbers
    @multiples = []
  end

  def to(max_num)
    set.each do |num|
      counter = 1
      loop do
        current_multiple = num * counter
        break if current_multiple >= max_num
        multiples << current_multiple
        counter += 1
      end
    end

    multiples.uniq.sum
  end

  def self.to(max_num)
    SumOfMultiples.new.to(max_num)
  end
end
