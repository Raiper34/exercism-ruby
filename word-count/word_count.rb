class Phrase

  WORD_REGEX = /\w+(?:'\w){0,1}/ # match all words without ' and words what contains '

  def initialize(text)
    @text = text
  end

  def word_count
    self.text_split.each_with_object(Hash.new(0)) { |word, map| map[word] += 1 }
  end

  def text_split
    @text.downcase.scan(WORD_REGEX)
  end

end
