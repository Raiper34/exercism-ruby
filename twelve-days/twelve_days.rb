class TwelveDays

  INT_WORDS = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)

  THINGS = [
      'a Partridge in a Pear Tree',
      'two Turtle Doves',
      'three French Hens',
      'four Calling Birds',
      'five Gold Rings',
      'six Geese-a-Laying',
      'seven Swans-a-Swimming',
      'eight Maids-a-Milking',
      'nine Ladies Dancing',
      'ten Lords-a-Leaping',
      'eleven Pipers Piping',
      'twelve Drummers Drumming'
  ]

  def self.song
    TwelveDays.new.song
  end

  def song
    (0...THINGS.size).map(&method(:verse)).join("\n")
  end

  private

  def verse(count)
    "On the #{INT_WORDS[count]} day of Christmas my true love gave to me: #{verseItems(items(count + 1))}\n"
  end

  def verseItems(items)
    "#{items[1...items.size-1].reverse.reduce(items.last){|acc, curr| "#{acc}, #{curr}"}}#{items.size == 1 ? '.' : ", and #{items.first}."}"
  end

  def items(count)
    THINGS.take(count)
  end

end
