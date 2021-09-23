=begin
PROBLEM:
Write a program that takes a word and a list of possible anagrams and selects
the correct sublist that contains the anagrams of the word.

Anagram = word that has all the letters, rearranged, as another word

Create an Anagram class
- Anagram::new -> takes one argument a string representing word to match
- Anagram#match -> takes one argument, an array of strings
  - returns array of all strings that are anagrams of word to match from ::new
  - anagrams are not case sensitive
  - the same number of each letter must be present in each word
    (i.e. galea is not an anagram of eagle one has two a's the other two e's)
  - same words are not anagrams (i.e. corn is not an anagram of corn)
  - a substring is not an anagram
  - if 0 anagrams are found, return an empty array

ALGORITHM
Input: a string representing a word to match + array of possible matches
Output: an array of anagrams, or empty array if no anagrams

Anagram::new
- Initialize a new Anagram instance
- Save the argument passed (a string) to an instance variable @word

Anagram#word
- Have the getter method return a lowercase version of @word

Anagram#match
- Initialize an empty array to hold the results
- Iterate through the array provided as argument
  - is the current string an anagram for #word?
    - if yes, add it to the array
- Return the results array

Anagram#anagram?(potential_anagram)
- ensure that potential_anagram is all lowercase
- return false if potential_anagram and #word are equal
- make sure that all the letters from word are the same in potential_anagram
- make sure that all the letters from potential_anagram and the same in word

Anagram#all_letters_match?(word1, word2)
- iterate from 0 to length of word1 - 1, tracking index
  - current_char = the char at the current index in word1
  - return false if the count of current_char in word1 and word2
    is not equal
- if we get through the whole iteration, return true
=end

class Anagram
  def initialize(word)
    @word = word
  end

  def word
    @word.downcase
  end

  def match(possible_anagrams)
    anagrams = []
    possible_anagrams.each do |possible_match|
      anagrams << possible_match if anagram?(possible_match.downcase)
    end
    anagrams
  end

  private

  def anagram?(possible_anagram)
    return false if word == possible_anagram
    all_letters_match?(word, possible_anagram) &&
      all_letters_match?(possible_anagram, word)
  end

  def all_letters_match?(word1, word2)
    (0...word1.size).each do |i|
      current_char = word1[i]
      if word1.count(current_char) != word2.count(current_char)
        return false
      end
    end
    true
  end
end
