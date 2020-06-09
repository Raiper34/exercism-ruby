class ResistorColorDuo

  COLORS = %w(black brown red orange yellow green blue violet grey white)

  def self.value(colors)
    colors.map{ |color| COLORS.index(color)}.join.to_i
  end

end
