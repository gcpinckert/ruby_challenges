=begin
PROBLEM:

Write a class acts like a clock.

- Should track both hours and mins (two separate integers)
- Be able to add and subtract minutes to result in a valid time calculation
- Define value equivalence for two clocks that have the same time
- Do not use any built-in Ruby date or time features
- Test cases use 24-hour time notation
- Define an initialize method that takes two arguments
  - integer representing number of hours
  - integer representing number of minutes 
  - i.e. Clock.new(hours, mins)
- Define a class method ::at
  - instantiates and returns a new Clock object with the given hours and mins
  - mins should be an optional argument with default value of 0
- Define a #to_s instance method
  - returns the clock objects time as a string
  - format: '00:00' in 24 hour time
- Define a + instance method
  - takes a single argument, n, an integer representing number of minutes
  - adds n amount of minutes to the time representation of the clock
  - if the number of minutes is larger than 60, it will adjust both the hours
    and minutes of the clock representation
  - the clock 'resets' at midnight. (i.e. 23:30 + 60 = 00:30)
  - you can add more than a day's worth of minutes and the correct time should
    be displayed
  - returns a new clock object, does not mutate calling clock object
- Define a - instance method
  - take a single argument, n, an integer representing number of mins
  - subtracts n mins from the time represented by the clock
  - follows similar rules to + method above
  - returns a new clock object, should not mutate the calling clock object
- Define a #== instance method
 - Should consider clocks that have the same time (hours, mins) to be equal

ALGORITHM:

- #to_s method
  - return a string of the format 00:00

- #+(mins) method
  - create a new results clock (should have same values as self)
  - get hours and mins to add
  - add hours to add to result clock hours
  - add mins to add to result clock mins
  - return the results clock

- #-(mins) method
  - create a new results clock (should have same values as self)
  - get hours and mins to sub
  - sub hours to sub from result clock hours
  - sub mins to sub from result clock mins
  - return the results clock

- hours and mins to calc(num_mins)
  - set hours_to_calc to 0
  - perform the following steps until the remainder is less than 60
    - get the quotient and remainder of dividing the number of mins given by 60
    - add the quotient to hours_to_calc
  - return [hours_to_cal, mins_to_calc(final remainder)]

- @hours setter method
  - define a constant HOURS (0...24).to_a
  - If the number is in the valid range of hours, set @hours to the num
  - Otherwise:
    - Get the remainder of dividing the num provided by hours/day
    - That should be the corresponding hour

- @mins setter method
  - if num is negative
    - set @hours to hours - 1
    - set @mins to remainder of num divided by mins per hour
  - if num is valid_num?
    - set num to num
  - otherwise
    - set num to remainder of num divided by mins per hour

- #==(other) method
  - check to see if both objects are clock objects
  - check to see if both hours getter methods return the same value
  - check to see if both minutes method return the same value
  - true if all above is true
=end

class Clock
  MINS_PER_HOUR = 60
  HOURS_PER_DAY = 24
  HOURS = (0...HOURS_PER_DAY).to_a

  attr_reader :hours, :mins
  attr_writer :mins

  def initialize(hours, mins)
    @hours = hours
    @mins = mins
  end

  def self.at(hours, mins=0)
    new(hours, mins)
  end

  def to_s
    sprintf("%02d:%02d", hours, mins)
  end

  def +(num_mins)
    hours_to_add, mins_to_add = hours_mins_to_calc(num_mins)
    result = Clock.new(hours, mins)
    result.hours += hours_to_add
    result.mins += mins_to_add
    result
  end

  def -(num_mins)
    hours_to_sub, mins_to_sub = hours_mins_to_calc(num_mins)
    result = Clock.new(hours, mins)
    result.hours -= hours_to_sub
    result.mins -= mins_to_sub
    result
  end

  def hours=(num)
    @hours = valid_hour?(num) ? num : num % HOURS_PER_DAY
  end

  def mins=(num)
    if valid_min?(num)
      @mins = num
    elsif num.negative?
      self.hours -= 1
      @mins = num % MINS_PER_HOUR
    else
      @mins = num % MINS_PER_HOUR
    end
  end

  def ==(other)
    other.class == Clock &&
    hours == other.hours &&
    mins == other.mins
  end

  private

  def valid_hour?(num)
    HOURS.include?(num)
  end

  def valid_min?(num)
    (0...MINS_PER_HOUR).cover?(num)
  end

  def hours_mins_to_calc(num_mins)
    num_hours = 0
    until num_mins < MINS_PER_HOUR
      hour, num_mins = num_mins.divmod(MINS_PER_HOUR)
      num_hours += hour
    end

    [num_hours, num_mins]
  end
end
