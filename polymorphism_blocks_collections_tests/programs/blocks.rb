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

