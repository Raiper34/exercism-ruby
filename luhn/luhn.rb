class Luhn

  MAX_NUMBER = 10

  def initialize(string)
    @string = string
  end

  def double(num)
    doubledNum = num + num
    doubledNum >= MAX_NUMBER ? doubledNum - MAX_NUMBER + 1 : doubledNum
  end

  def checksum
    digits.reverse.each_slice(2).sum { |a, b = 0| a + double(b) }
  end

  def only_digits?
    @string !~ /[^\d|\s]/
  end

  def digits
    @string.scan(/\d/).map(&:to_i)
  end

  def valid?
    only_digits? && digits.size > 1 && checksum.modulo(10).zero?
  end

  def self.valid?(string)
    Luhn.new(string).valid?
  end

  private :double, :checksum, :only_digits?

end
