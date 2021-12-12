class DNA
  attr_reader :strand
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    mutations = 0
    other_strand = other.chars
    strand.chars.each_with_index do |nucleotide, idx|
      return mutations if idx == other_strand.size
      mutations += 1 if nucleotide != other_strand[idx]
    end 
    mutations
  end
end