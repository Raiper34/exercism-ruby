class Isogram

  def self.isogram?(input)
    charArray = input.downcase.scan(/\w/)
    charArray.uniq.length == charArray.length
  end

end
