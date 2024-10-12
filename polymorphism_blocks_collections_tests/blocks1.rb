def passing_array (array, index)
  if index >= array.size
    raise ArgumentError.new('Индекс элемента больше размера массива')
  end

  yield(array, array[index])

end

def is_elem_global_max? (array, index)
  passing_array(array, index) do |array, element|
    return element == array.max
  end

end

def is_elem_local_min? (array, index)
  passing_array(array, index) do |array, element|
    return element == array.min
  end

end


def circular_shift_to_left ()

end

def elems_with_even_indexes (array)
  str = 'Четный индексы: '

end

def elems_with_odd_indexes (array)
  str = 'Нечетные индексы: '
end


def print_elems_with_even_and_odd_indexes (array)
  array.each_index {|i| print "#{array[i]}, " if i.even?}
  array.each_index {|i| print "#{array[i]}, " if i.odd?}
end


def main()
  begin
    array = Array.new([1, 2, 3, 5, -9])

    p is_elem_global_max?(array, 3)
    p is_elem_local_min?(array, 0)

    print_elems_with_even_and_odd_indexes (array)

  rescue => err
    puts err

  end

end

main()

