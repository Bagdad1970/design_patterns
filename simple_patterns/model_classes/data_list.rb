class Data_List

  attr_accessor :sorted_array

  private :sorted_array=

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

  def select(number)
    if number <= 0 or number > self.sorted_array.size
      raise IndexError.new('Неверный индекс')
    end

    self.sorted_array[number-1][:selected] = true
  end

  def get_selected
    self.sorted_array.find_all{|elem| elem[:selected] == true}
  end

  public :select, :get_selected

  def get_names
    obj_fields = self.sorted_array.first[:data].instance_variables
    obj_fields.delete(:@id)

    return obj_fields
  end

  public :get_names

  def get_data

  end

  private :get_data

  def to_s
    "Data_List array: #{self.sorted_array.to_s}"
  end

end
