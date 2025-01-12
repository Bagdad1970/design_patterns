class Data_List

  attr_reader :sorted_array

  private :sorted_array

  def initialize(array)
    self.sorted_array = array
  end

  def sorted_array=(array)
    if array.is_a?(Array) == true
      sorted_array = []

      array.sort{|a, b| b <=> a}.each do |elem|
        sorted_array.append({data: elem, selected: false})
      end

      @sorted_array = sorted_array
    else
      raise ArgumentError.new("Неверный тип входных данных: #{array}")
    end
  end

  public :sorted_array=

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
  end

  def get_data(attribute_names)
  end

  protected :get_names, :get_data

  def get_data_table
    attribute_names = self.get_names
    data_table = get_data(attribute_names)

    return data_table
  end

end
