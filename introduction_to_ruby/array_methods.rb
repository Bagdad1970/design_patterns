def min_elem(array)
  if array.empty? then
    return nil
  end

  min = array[0]

  for i in 1...(array.size) do
    if array[i] < min then
      min = array[i]
    end

  end

  return min
  
end


def first_positive_elem(array)
  if array.empty? then
    return nil
  end

  i = 0
  while i < array.size
    if array[i] > 0 then
      return i
    end

    i += 1
  end

  return nil

end

