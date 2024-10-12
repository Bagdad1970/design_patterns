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
