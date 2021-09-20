=begin
PROBLEM:
Given a letter, output a diamond shape in which each line is a letter in
alphabetical order. The top and bottom points of the diamond will always be the
letter `A`. Followed by two B's separated by a single space. Etc. The given letter
determines the size of the diamond in that it represents the "middle", or largest
line of the diamond.

Rules:
- The first and last row each contain one `A`
- All rows (except the first and last) have exactly 2 identical letters
- The diamond is horizontally and vertically symmetrical
- The width and height of the diamond are equal (it has a square shape)
- The letters form the diamond shape
- The top half (A -> given letter) is in ascending order
- The bottom hald (given letter -> A) is in descending order
- The four corners around the diamond (containing spaces) are triangles
- Spaces inside the diamond move up in odd increments (0, 1, 3, 5, 7)
- Spaces outside the diamond move down in single decrements, the first
  matching the index of given letter in alphabet array (i.e. 4, 3, 2, 1, 0)
- If we create an array of diamond lines A-> given letter, we can iterate
  through that backwards to get the bottom half of the diamond
    - But we will have to ensure we skip the middle (given letter) line
- Instead of just outputting this to the console, we should make a string
  representation of the diamond

EXAMPLES:
Given `A`:
A

Given C:
**A**    A
*B*B*   B B
C***C  C   C
*B*B*   B B
**A**    A

Given E:
    A             ****A****
   B B            ***B*B***  
  C   C           **C***C** 
 D     D          *D*****D*
E       E         E*******E 
 D     D
  C   C
   B B
    A

TEST CASES:

- Create a Diamond class
- Create a ::make_diamond class method that should accept one argument
 - arg = the given letter (largest middle line)
 - returns a string representation of the diamond

DATA STRUCTURES:
- Input: string, a letter representing middle & longest line of the diamond
- Output: string, single string representing diamond with a "square" shape
  - i.e. should include trailing whitespace
- Internally: build "lines" of diamond with an array. This way we can iterate
  up to given letter line to create the string and then back down the array

ALGORITHM:
- Initialize the diamond:
  - Get the letters
  - Initialize the number of outside spaces to the index of the given letter in
    the letters array
  - Initialize the number of inside spaces to 1

- Get the letters:
  - Initialize a range from A to the given letter to determine the letters in
    the diamond
  - Convert the range to an array (lines)

- Make the "lines" array:
  - Iterate over the letters in the array, transforming
    - get the "inner_string"
    - center the "inner_string" in the number of outside spaces * 2
    - decrement the number of outside spaces by 1
  - Return the transformed array

- Get the "inner_string"
  - If the letter is A, just return A
  - Otherwise:
    - return LETTER + (' ' * inside_spaces) + LETTER
    - increment inside_spaces by 2

- Make the diamond string:
  - Join the lines array with a newline delimiter = top
  - Get the lines array less the last element (given letter line)
  - Reverse this and join with a newline delimiter = bottom
  - Concatenate top and bottom with a newline in between
  - Return the resulting string
=end

class Diamond
  def initialize(letter)
    letter = letter.upcase
    @letters = ('A'..letter).to_a
    @lines = []
    @outside_spaces = @letters.index(letter)
    @inside_spaces = 1
  end

  def self.make_diamond(letter)
    diamond = Diamond.new(letter)
    diamond.generate_lines!
    diamond.diamond_string
  end

  def generate_lines!
    @letters.each do |letter|
      @lines << "#{' ' * @outside_spaces}#{inner_string(letter)}#{' ' * @outside_spaces}"
      @outside_spaces -= 1
    end
  end

  def inner_string(letter)
    return 'A' if letter == 'A'
    string = letter + (' ' * @inside_spaces) + letter
    @inside_spaces += 2
    string
  end

  def diamond_string
    top = @lines.join("\n")
    bottom = @lines[0..-2].reverse.join("\n")
    diamond = top + "\n" + bottom
    diamond[-1] == "\n" ? diamond : diamond + "\n"
  end
end
