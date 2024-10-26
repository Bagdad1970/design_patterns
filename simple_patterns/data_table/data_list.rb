class Data_List

  attr_accessor :sorted_array

  private :sorted_array, :sorted_array=

  def initialize(array)
    self.sorted_array = array.sort{|a, b| b <=> a}
  end

  def [](index)
    if index < 0 or index >= self.sorted_array.size
      raise IndexError.new('Неверный индекс')
    end

    self.sorted_array[index]
  end

  def to_s
    self.sorted_array.to_s
  end

end
