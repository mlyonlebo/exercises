class BeerSong
  def self.verse(verse_number)
    case verse_number
    when 3..99
      "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\n" \
      "Take one down and pass it around, #{verse_number - 1} bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def self.verses(first_verse, last_verse)
    verses = []
    first_verse.downto(last_verse) do |verse_number|
      verses << verse(verse_number)
    end
    verses.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end 
end