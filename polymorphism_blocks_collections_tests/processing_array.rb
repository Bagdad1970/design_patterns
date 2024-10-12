class Processing_Array
  
  attr_reader :array

  def initialize(array)
    self.array = array
  end

  def array=(array)
    if array.is_a? (Array)
      @array = array  
    else
      raise TypeError.new('Неверный тип входных данных')
    end
  end

  private :array=

  def [](index)
    if index >= array.size
      raise RangeError.new('Индекс больше максимально допустимого')
    end

    return self.array[index]
  end

end

