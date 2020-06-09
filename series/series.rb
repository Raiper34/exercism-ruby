class Series

   def initialize(serieString)
    @serieArray = serieString.chars
   end

  def slices(serieSize)
    raise ArgumentError if @serieArray.length < serieSize
    @serieArray.each_cons(serieSize).map(&:join)
  end

end
