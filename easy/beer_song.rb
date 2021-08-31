=begin
PROBLEM:
Write a program that can generate the lyrics of the 99 Bottles of Beer song.

EXAMPLES / TEST CASES:
Define a BeerSong class
Expected lyric structure: 
  "99 bottles of beer on the wall, 99 bottles of beer.\n" \
  "Take one down and pass it around, 98 bottles of beer on the wall.\n"
-> Each line of verse ends with a newline
-> Verses are separated by blank lines
-> note that "bottles" will change to "bottle" when the number decreases to 1
-> note that the last verse is different from the others (0)

a class method ::verse
-> takes a single argument, integer representing the verse number
-> returns the "verse lyric" according to example above.
-> When we get to 1, the lyrics change:
  1 bottle of beer on the wall, 1 bottle of beer.
  Take it down and pass it around, no more bottles of beer on the wall.
-> When we get to 0, the lyrics change:
  No more bottles of beer on the wall, no more bottles of beer.
  Go to the store and buy some more, 99 bottles of beer on the wall.

a class method ::verses
-> takes two arguments, integers representing the first verse and last verse in a
   range of verses to return
-> returns all the verses in the range provided
-> see above for differences in verses 1 and 0
-> multiple verses should have an empty line between them

a class method ::lyrics
-> Should generate all lyrics for the whole song
-> There is an empty line between lyric numbers
-> When we get to 1, the lyrics change:
  1 bottle of beer on the wall, 1 bottle of beer.
  Take it down and pass it around, no more bottles of beer on the wall.
-> When we get to 0, the lyrics change:
  No more bottles of beer on the wall, no more bottles of beer.
  Go to the store and buy some more, 99 bottles of beer on the wall.

DATA STRUCTURES:
Input: an integer or integers representing verse numbers or a range of verses
Output: string, the verses of the song
Internally: an array to collect multiple verses?

ALGORITHM:
BeerSong::Verse
- Initialize a bottles variable to the number provided as an argument
- If the bottles > 2
  return *bottles* bottles of beer on the wall, *bottles* bottles of beer.\n +
         Take one down, pass it around, *bottles - 1* bottles of beer on the wall.\n
- If bottles == 2
  return *bottles* bottles of beer on the wall, *bottles* bottles of beer.\n +
         Take one down, pass it around, *bottles - 1* bottle of beer on the wall.\n
- If bottles == 1
  return *bottles* bottles of beer on the wall, *bottles* bottles of beer.\n +
         Take one down, pass it around, no more bottles of beer on the wall.\n
- If bottles == 0
  return "No more bottles of beer on the wall, no more bottles of beer.\n" \
         "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

BeerSong::Verses
- Initialize an empty array to hold the verses
- Start at the first argument (larger number) and go down to the second argument
- Track the verse number
  - Add the value returned by BeerSong::verse for the current verse number to
    the results array
- Join the results array into a string with a newline delimiter and return the result

BeerSong::lyrics
- Return the value for BeerSong::verses when given 99 and 0 as arguments
=end

class BeerSong
  def self.verse(verse)
    case verse
    when (3..99) then regular_verse(verse)
    when 2 then two_one_verse(verse)
    when 1 then penultimate_verse(verse)
    when 0 then last_verse
    end
  end

  def self.verses(verse1, verse2)
    verses = []
    verse1.downto(verse2) do |verse|
      verses << verse(verse)
    end
    verses.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def regular_verse(verse)
      "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\n" \
      "Take one down and pass it around, #{verse - 1} bottles of beer on the wall.\n"
    end

    def two_one_verse(verse)
      "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\n" \
      "Take one down and pass it around, #{verse - 1} bottle of beer on the wall.\n"
    end

    def penultimate_verse(verse)
      "#{verse} bottle of beer on the wall, #{verse} bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def last_verse
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end