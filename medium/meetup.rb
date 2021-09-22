=begin
PROBLEM:
Create a class called Meetup that has the following capabilities:
- A Meetup object should be initialized with two arguments:
  - a month, represented by an integer 1-12
  - a year (4 digit integer such as 2021)
- The class interface should have some method that returns the date for the
  meeting in the specified month and year
  - the date is determined by the "schedule" of the meetup, consisting of a
    weekday (Mon, Tues, etc) and a frequency descriptor ('first', 'second')
- Days of the week are given as the following strings:
  - 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday',
    'Sunday'
- Frequency descriptors are given as follows:
  - 'first' -> the first day of the given month in the given year
    - between 1st - 7th of the given month
  - 'second' -> the second day of the given month in the given year
    - between 8th and 14th of the given month
  - 'third' -> the third day of the given month in the given year
    - between 15th and 21st of given month
  - 'fourth' -> the fourth day of the given month in the given year
    - between 22nd and 28th of given month
  - 'fifth' -> the fifth day of the given month in the given year
    - note: this may not happen each month. What to return if there is no
      fifth day of the given month in the given year? (nil)
    - between 29th and 31st of given month
  - 'last' -> the last day of the given month in the given year
    - between 22nd and 31st of month (if month has 31 days)
  - 'teenth' -> defined as the only weekday of the given months whose ordinal
    number day ends in 'teenth'.
      - there are exactly 7 date numbers that end in teenth, so each month
        will have exactly one teeth day per month
- When analyzing string input all should be considered case insensitive
- Months:
  - months 4, 6, 9, and 11 have 30 days
  - month 2 has 28 days
  - months 1, 3, 5, 7, 8, 10, 12 have 31 days

EXAMPLES/TEST CASES:
- Define a Meetup class
- Meetup#initialize takes two arguments: (year, month) i.e. (2013, 3)
  - save the year integer to a @year instance variable
  - save the month integer to a @month instance variable

- Meetup#day method takes two arguments:
  - a string representing day of the week (case insensitive) (see above)
  - a string representing frequency descriptor (case insensitive) (see above)
  - returns the `Date` object representing the meetup date as determined by
    the frequency descriptor and weekday for the given month and year

DATA STRUCTURES:
- Input:
  - two integers (month and year)
  - two strings (weekday and schedule descriptor)
- Output: `Date` object
- Internally:
  - Create an array of the date range in which the meetup occurs
  - we can iterate over this and check each element to see which matches
    the desired weekday
- Note: determine the last day of the month by passing arg -1 to Date.civil
  this creates a Date obj representing last day of the month
- Date class contains constant DAYNAMES which references an array of weekdays

ALGORITHM:
- Initialize a constant TESTER_METHODS references a hash of weekday names and
  the corresponding method to test days from Date (i.e. friday?)

- Meetup#initialize
  - save the year and month into instance variables

- Meetup#day(weekday, descriptor)
  - set the weekday to a lowercase version of the weekday string provided
  - set the descriptor to a lowercase version of the string provided
  - generate a array of Dates to test against based on descriptor
  - determine which method to use to test based on weekday string
  - iterate over array of Dates, select the dates that corresponds to the test
    method 
  - return the last element in the resulting array
    - if array is empty this returns nil
    - in the case of 'last' we may have more than one match

- Generate an array of Dates to test against based on descriptor
  - 'first' -> array of Dates from (year, month, 1) to (year, month, 7)
  - 'second' -> array of Dates from (year, month, 8) to (year, month, 14)
  - 'third' -> array of Dates from (year, month, 15) to (year, month, 21)
  - 'fourth' -> array of Dates from (year, month, 22) to (year, month, 28)
  - 'fifth' -> array of Dates from (year, month, 29) to (year, month, MAX_DATE)
  - 'last' -> array of Dates from (year, month, 22) to (year, month, MAX_DATE)
  - 'teenth' -> array of Dates from (year, month, 13) to (year, month, 19)

- Generate an array of Dates(start_date, end_date)
  - initialize an array to hold results
  - iterate from start_date to end_date tracking day
    - instantiate a new civil date object in the given year, month, and day
    - add it to the results array
  - return the results array

- Get the max date in a given month
  - initialize a hash whose key is the month (integer) and whose value is the
    last day of that month
  - feb will have to call a method so we can determine if it is a leap year
    could be 28 or 29
=end

require 'date'

class Meetup
  MAX_DATES = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
                7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }
  TESTER_METHODS = { 'monday' => :monday?, 'tuesday' => :tuesday?,
                     'wednesday' => :wednesday?, 'thursday' => :thursday?,
                     'friday' => :friday?, 'saturday' => :saturday?,
                     'sunday' => :sunday? }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, descriptor)
    weekday = weekday.downcase
    descriptor = descriptor.downcase
    dates_to_test(descriptor).select(&TESTER_METHODS[weekday]).last
  end

  private

  attr_reader :year, :month

  def dates_to_test(descriptor)
    case descriptor
    when 'first' then collect_dates(1, 7)
    when 'second' then collect_dates(8, 14)
    when 'third' then collect_dates(15, 21)
    when 'fourth' then collect_dates(22, 28)
    when 'fifth' then collect_dates(29, max_date)
    when 'last' then collect_dates(22, max_date)
    when 'teenth' then collect_dates(13, 19)
    else raise ArgumentError "Invalid schedule descriptor"
    end
  end

  def collect_dates(start_day, end_day)
    dates = []
    (start_day..end_day).each { |day| dates << Date.civil(year, month, day) }
    dates
  end

  def max_date
    max_dates = { 1 => 31, 2 => feb_max, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
      7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }
    max_dates[month]
  end

  def feb_max
    Date.new(year).leap? ? 29 : 28
  end
end
