class Matrix

  attr_reader :rows
  attr_reader :columns

  def initialize(matrixString)
    @rows = matrixString.split(/\n/).map{ | row | row.scan(/\d+/).map(&:to_i) }
    @columns = @rows.transpose
  end

end
