=begin
Write a program that takes a word and a list of possible anagrams 
and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like 
"enlists", "google", "inlets", and "banana", 
the program should return a list containing "inlets". 

Please read the test suite for the exact rules of anagrams.

A
main method to iterate through the collection of possible anagrams

helper method that takes a word and tells whether it is an anagram

=end


class Anagram
  attr_reader :word
  def initialize(word)
    @word = word
  end



  def is_anagram?(possible_anagram)
    return false if word.downcase == possible_anagram.downcase
    word.downcase.chars.sort == possible_anagram.downcase.chars.sort
  end

  def match(possible_anagrams)
    possible_anagrams.each_with_object([]) do |possible_anagram, anagrams|
      anagrams << possible_anagram if is_anagram?(possible_anagram)
    end
  end
end
