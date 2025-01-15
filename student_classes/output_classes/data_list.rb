class Data_List

  attr_reader :data_list
  private :data_list

  def initialize(array=[])
    self.data_list = array
  end

  def data_list=(array)
    raise ArgumentError.new("Неверный тип входных данных") if array.is_a?(Array) == false 
      
    data_list = array.reduce([]) {|acum, elem| acum.append({data: elem, selected: false})}
    @data_list = data_list
  end

  def replace_array(new_array)
    raise ArgumentError.new("Неверный тип входных данных") if new_array.is_a?(Array) == false

    if new_array.size == 0
      self.data_list = []

    elsif new_array.size <= self.size
      self.data_list[0...new_array.size].each_with_index do |elem, index|
        elem[:data] = new_array[index]
        elem[:selected] = false
      end

      self.data_list[new_array.size...self.size].each {|elem| elem[:data] = nil, elem[:selected] = false}

    elsif new_array.size > self.size
      self.data_list.each_with_index do |elem, index|
        elem[:data] = new_array[index]
        elem[:selected] = false
      end

      new_array[self.size...new_array.size].each do |elem|
        self.data_list.append({data: elem, selected: false})
      end
    end
  end

  def size
    self.data_list.size
  end

  def count
    self.data_list.size
  end

  def [](index)
    if index < 0 or index >= self.data_list.size
      raise IndexError.new('Неверный индекс')
    end

    self.data_list[index]
  end

  def select(number)
    if number <= 0 or number > self.data_list.size
      raise IndexError.new('Неверный индекс')
    end

    self.data_list[number-1][:selected] = true
  end

  def get_selected
    self.data_list.find_all {|elem| elem[:selected] == true}
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
