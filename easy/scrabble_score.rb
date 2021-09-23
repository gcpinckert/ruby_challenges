=begin
PROBLEM
Write a program that computes the Scrabble score for a given word

Letter Values:
A E I O U L N R S T -> 1
D G                 -> 2
B C M P             -> 3
F H V W Y           -> 4
K                   -> 5
J X                 -> 8
Q Z                 -> 10

Find the score by summing the values of all the tiles used in each word

EXAMPLES/TEST CASES
cabbage
c * 1 -> 3 * 1 = 3
a * 2 -> 1 * 2 = 2
b * 2 -> 3 * 2 = 6
g * 1 -> 2 * 1 = 2
e * 1 -> 1 * 1 = 1
               = 14

Create a Scrabble class
- New instance should initialize with a single string argument

Define a method Scrabble#score that returns an integer representing the score of
the string passed in during instantiation
- An empty string should score 0
- A string containing only whitespace should score 0
- A nil value is valid to pass in and returns a score of 0
- Scores should be generated in a case insensitive manner

Define a class method that can also return the score
- accepts one argument, the word to score
- returns an integer representing score

DATA STRUCTURES:
Input: a string, but should be able to deal with invalid input such as nil
Output: an integer representing the scrabble score
Internally:
 - array to iterate over word point values?
 - hash to hold point values and their letters?

ALGORITHM:

Scrabble::new:
- Initialize with a single string argument
- If the argument is not a valid string (i.e. nil), assign an empty string
  to and instance variable @word
- otherwise, assign the argument to the instance variable @word
- ensure that this value is assigned as lowercase (case insensitive scores)

- Initialize a constant POINT_VALUES to hold the letters and their points

Scrabble#score:
- Convert the string to an array of characters
- Iterate through the array of characters, transforming
  - Get the point value associated with the current character
- Return the sum of the transformed array

Scrabble#point_value(letter)
- Iterate through the keys of POINT_VALUES
- If the current key includes the letter passed as argument
  - return the associated value
- If we iterate through the entire hash with no return, return 0
=end

class Scrabble
  POINT_VALUES = { 'aeioulnrst' => 1, 'dg' => 2, 'bcmp' => 3, 'fhvwy' => 4,
                   'k' => 5, 'jx' => 8, 'qz' => 10 }

  attr_reader :word

  def initialize(str)
    @word = str ? str.downcase : ''
  end

  def score
    word.chars.map { |letter| point_value(letter) }.sum
  end

  def self.score(str)
    Scrabble.new(str).score
  end

  private

  def point_value(letter)
    POINT_VALUES.keys.each do |letters|
      return POINT_VALUES[letters] if letters.include?(letter)
    end
    0
  end
end
