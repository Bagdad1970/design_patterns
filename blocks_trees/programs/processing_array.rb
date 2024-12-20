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

  def <=>(other)
    if self.array.sum < other.array.sum
      return -1
    elsif self.array.sum == other.array.sum
      return 0
    else
      return 1
    end
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

  def min(value = nil)
    if !(block_given?) and value.nil?
      min_elem = self.array[0]
      self.array[1..].each do |potential_min_elem|
        if potential_min_elem < min_elem
          min_elem = potential_min_elem
        end
      return min_elem

      end
    
    elsif !(block_given?) and !(value.nil?)
      return self.array.sort[0..value-1]

    elsif block_given? and value.nil?
      min_elem = self.array[0]
      self.array[1..].each do |potential_min_elem|
        if yield(potential_min_elem, min_elem) == -1  # elem < min_elem
          min_elem = potential_min_elem
        end
      end

      return min_elem

    elsif block_given? and !(value.nil?)
      sorted_array = self.array[0..].sort do |a, b|
       yield(a, b)
      end

      return sorted_array[0..value-1] 
    end
  end

  def partition
    if !(block_given?)
      return self.array.partition
    end

    partition_array = [[], []]
    self.array.each do |elem|
      if yield(elem) == true
        partition_array[0].append(elem)
      else
        partition_array[1].append(elem)   
      end
    end

    return partition_array
  end

  def take_while
    if !(block_given?)
      return self.array.take_while
    end

    take_while_array = []
    self.array.each do |elem|
      if yield(elem) == false
        break
      end
      take_while_array.append(elem)
    end
    
    return take_while_array
  end

end
