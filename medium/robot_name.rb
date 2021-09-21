=begin
PROBLEM:
- Write a program that generates random names for robots.
- Random names should have the format XX000 (i.e. RX837, BC811)
  - Should match /^[A-Z]{2}\d{3}$/
- Name should persist with the Robot after instantiation
- Robots should be able to be "reset", i.e. their name gets wiped
- After robots are reset they are assigned a new and different random name
  - This happens immediately after the name is "wiped" so the robot always has
    a name
- Do not allow the same name to be assigned twice
  - If a previously assigned name is randomly generated, do not allow it to be
    assigned
- No input is required as names are randomly generated

EXAMPLES:
- Create a Robot class with two methods:

- name -> returns the robots randomly generated name in the correct format
- reset -> current robot name is deleted and new randomly generated name
           (different) is assigned

DATA STRUCTURES:
- Input: none
- Output: name should return a string, reset just modifies the robot object
- Internally:
  - array to track previously assigned names?

ALGORITHM:
- Initialize a class variable names to reference an array that tracks names
  which have already been assigned

- Initialize a Robot object with the instance variable @name
- Assign name:
  - Initialize an empty string to be the name
  - Select a random letter A-Z to add to the string (do this twice)
  - Select a random digit 0-9 to add to the string (do this three times)
  - Check to make sure the string is not included in previous_names
  - If it isn't, return the string
  - If it is, repeat the above steps until a new random name is generated
  - Add the name to the previous_names array

- Reset method
  - Get rid of the current name
  - Reassign a new name
=end

class Robot
  @@previous_names = []

  attr_reader :name

  def initialize
    @name = new_name
  end

  def reset
    previous_name = @name
    @name = new_name
    @@previous_names.delete(previous_name)
  end

  private

  def new_name
    n = ''
    loop do
      2.times { n << ('A'..'Z').to_a.sample }
      3.times { n << ('0'..'9').to_a.sample }
      break unless @@previous_names.include?(n)
      n = ''
    end

    @@previous_names << n
    n
  end
end