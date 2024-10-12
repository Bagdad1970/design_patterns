require './processing_array.rb'

def main
  array = Array.new([1, 0, 2, -3, 4, 5, 0, 1000])

  process_array = Processing_Array.new(array)

  p process_array.filter_map{|elem| elem * 2}

  p process_array.filter_map

  process_array1 = Processing_Array.new([-10, 10, 1, 2, 3, 4])

  p process_array1.group_by
  p process_array1.group_by{|i| i % 2 == 0}

  proc_arrays = Array.new([Processing_Array.new([10, 10, -100, 198]), Processing_Array.new([-1, -6, -4, 0]), Processing_Array.new([2, 5, 1, 0, 9])])

  p proc_arrays 
  p "min: #{proc_arrays.min}"

  p process_array1.partition
  p process_array1.partition{|i| i.even?}

  p process_array1.take_while
  p process_array1.take_while{|elem| elem <= 3}

end

main
