class Data_List

  attr_accessor :sorted_array

  private :sorted_array, :sorted_array=

  def initialize(array)
    self.sorted_array = []
    array.sort{|a, b| b <=> a}.each do |elem|
      self.sorted_array.append({data: elem, selected: false})
    end

  end

  def [](index)
    if index < 0 or index >= self.sorted_array.size
      raise IndexError.new('Неверный индекс')
    end

    self.sorted_array[index]
  end

  def select(index)
    if index < 0 or index >= self.sorted_array.size
      raise IndexError.new('Неверный индекс')
    end

    self.sorted_array[index][:selected] = true
  end

  def get_selected
    self.sorted_array.find_all{|elem| elem[:selected] == true}
  end

  def to_s
    self.sorted_array.to_s
  end

end
