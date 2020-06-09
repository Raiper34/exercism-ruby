class Scrabble

  SCORE_TO_TILE = {
      1  => %w(A E I O U L N R S T),
      2  => %w(D G),
      3  => %w(B C M P),
      4  => %w(F H V W Y),
      5  => %w(K),
      8  => %w(J X),
      10 => %w(Q Z)
  }

  def initialize(word)
    @word = word
  end

  def self.tile_score(tile)
    SCORE_TO_TILE.select { |_, values| values.include?(tile) }.keys.first
  end

  def score()
    Scrabble.score(@word)
  end

  def self.score(word)
    word
        .to_s
        .upcase
        .scan(/\w/)
        .map { |tile| self.tile_score(tile)}
        .sum
  end

end
