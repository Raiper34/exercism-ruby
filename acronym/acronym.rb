class Acronym

  def self.abbreviate(text)
    text.scan(/\b\w/).join.upcase
  end

end