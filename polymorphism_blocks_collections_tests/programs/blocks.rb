def passing_array (array, index)
  if index <= 0 || index >= array.size
    raise ArgumentError.new('Неверный индекс')
  end

  yield(array, array[index])
end

def is_elem_global_max? (array, index)
  passing_array(array, index) do |array, element|
    return element == array.max
  end
end

def is_elem_extremum?(array, index)
  if index <= 0 || index >= array.size
    raise ArgumentError.new('Неверный индекс')
  end

  left_elem = (index != 0)? array[index-1] : array[index] - 1
  right_elem = (index != array.size-1)? array[index+1] : array[index] - 1

  yield(array[index], left_elem, right_elem)
end

def is_elem_local_min? (array, index)
  is_elem_extremum?(array, index) {|current, left, right| current < left && current < right}
end

p is_elem_local_min?([1,2,-4,5,6], 1)

def circular_shift_to_left (array)
  first_elem = array.shift

  return array.append(first_elem)
end

def print_elems_with_even_and_odd_indexes(array)
  print "Четный индексы: "
  array.each_index {|i| print "#{array[i]} " if i.even?}
  print "\n"
  print "Нечетные индексы: "
  array.each_index {|i| print "#{array[i]} " if i.odd?}
  print "\n"
end

def unrepeated_elems_array(array)
  array.each do |elem|
    if !(unrepeated_array.include?(elem))
      unrepeated_array.append(elem)
    end
  end

  return unrepeated_array
end

def frequency_array(array, unrepeated_array)
  frequency_array = []

  unrepeated_array.each do |elem|
    frequency_array.append(array.count(elem))
  end

  return frequency_array
end

def unrepeated_and_frequency_arrays(array)
  unrepeated_array = unrepeated_elems_array(array)
  frequency_array = frequency_array(array, unrepeated_array)

  return [unrepeated_array, frequency_array]
end


