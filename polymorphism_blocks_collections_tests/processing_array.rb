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

  def count(value = nil)
    if value.nil? and block_given?
      counter = 0
      self.array.each do |elem|
        if yield(elem) == true
          counter += 1
        end
      end

      return counter

    elsif !(value.nil?) and !(block_given?)
      counter = 0
      self.array.each do |elem|
        if elem == value.to_i
          counter += 1
        end
      end

      return counter

    else
      return self.array.size
    end

  end

  def filter_map
    if !(block_given?)
      return self.array.filter_map
    end

    result_array = Array.new()
    self.array.each do |elem|
      result_array.append(yield(elem))
    end
  
    return result_array

  end

  def group_by
    if !(block_given?)
      return self.array.group_by
    end

    hash = {}
    self.array.each do |elem|
      key = yield(elem)
      if hash[key].nil?
        hash[key] = [elem]
      else
        hash[key].append(elem)
      end
    end

    return hash

  end


end

