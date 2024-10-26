class Data_Table

  attr_accessor :matrix

  private :matrix, :matrix=

  def initialize(matrix)
    self.matrix = matrix
  end

  def [](row_index, column_index)
    self.matrix[row_index][column_index]
  end

  def to_s
    self.matrix.to_s 
  end

end
