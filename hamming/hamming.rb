class Hamming

  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length
    strand1
        .chars
        .zip(strand2.chars)
        .select { |charTupple| charTupple[0] != charTupple[1]}
        .length
  end

end
