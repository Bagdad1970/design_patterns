class Data_Table

  attr_accessor :matrix

  private :matrix, :matrix=

  def initialize(matrix)
    self.matrix = matrix
  end

  def [](row_index, column_index)
    if row_index < 0 or row_index >= self.row_count
      raise IndexError.new('Неверный индекс строки')
    elsif column_index < 0 or column_index >= self.column_count
      raise IndexError.new('Неверный индекс столбца')
    end

    self.matrix[row_index][column_index]
  end

  def row_count
    self.matrix.size
  end

  def column_count
    self.matrix.max{|a, b| a.size <=> b.size}.size
  end

  def to_s
    self.matrix.to_s 
  end

end
