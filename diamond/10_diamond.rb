class Diamond
  def self.make_diamond(letter)
    rows = make_rows(letter)
    counter = (rows.size - 2)
    while counter >= 0
      rows << rows[counter]
      counter -= 1
    end
    add_newline(rows).join
  end

  def self.add_newline(rows)
    rows.map do |str|
      str + "\n"
    end
  end

  def self.make_rows(letter)
    letters = ('A'..letter).to_a
    result = ['A']
    letters.each_with_index do |letter, idx|
      next if letter == 'A'
      add_outer_padding(result)
      result << (letter + inner_padding(idx) + letter)
    end
    result
  end

  def self.inner_padding(idx)
    ' ' * ((idx * 2) - 1)
  end

  def self.add_outer_padding(result)
    result.each do |string|
      string.prepend(' ')
      string.concat(' ')
    end
  end
end