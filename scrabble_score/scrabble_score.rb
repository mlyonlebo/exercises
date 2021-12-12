class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word.nil? ? '' : word
  end

  def self.score(str)
    Scrabble.new(str).score
  end

  def letter_score(letter)
    case letter
    when /[aeioulnrst]/
      1
    when /[dg]/
      2
    when /[bcmp]/
      3
    when /[fhvwy]/
      4
    when /[k]/
      5
    when /[jx]/
      8
    when /[qz]/
      10
    else
      0
    end
  end

  def score
    total_score = 0
    word.chars.each do |letter|
      total_score += letter_score(letter.downcase)
    end
    total_score
  end
end

