require 'minitest/autorun'
require '../programs/processing_array'

class TestProcessing_Array < Minitest::Test

  def test_count
    proc_array = Processing_Array.new([1, -2, 3, 0, 5.5, 1])
    
    assert(proc_array.count, 6)
    assert(proc_array.count(1), 2)
    assert(proc_array.count{|x| x % 2 == 0}, 2)
  end

  def test_filter_map
    proc_array = Processing_Array.new([1, 0, -5.1, 1, 7, -5])

    assert(proc_array.filter_map{|x| x >= 0}, [1, 0, 1, 7])
    assert(proc_array.filter_map{|x| x*2 if x % 2 == 0}, [0, -10])
  end

  def test_min
    proc_array_int = Processing_Array.new([1, 6, -10, 2, 6.7, 0])

    assert(proc_array_int.min, -10)
    assert(proc_array_int.min(3), [-10, 0])

    proc_array_string = Processing_Array.new(['hello', 'name', 'is', 'bruh', 'the', 'ejiej'])
    assert(proc_array_string.min{|a, b| a.size <=> b.size}, 'is')
    assert(proc_array_string.min(2){|a, b| a.size <=> b.size}, ['is', 'the'])
  end

  def test_group_by
    proc_array = Processing_Array.new([-1, 2, "3", -4, 5])

    assert(proc_array.group_by{|x| x % 2}, {1=>[-1, 5], 0=>[2, -4], "3"=>["3"]})
  end

  def test_partition
    proc_array = Processing_Array.new([5, 0, -1, 6, -90, 100])

    assert(proc_array.partition{|x| x*2 if x.even?}, [[0, 12, -180, 200], [10, -2]])
  end

  def test_take_while
    proc_array = Processing_Array.new([1, '0', {'hash1': "hash"}, -5, [1, 2, -9], 6, 123, 6.7])

    assert(proc_array.take_while{|x| x.is_a? (Array)}, [1, '0', {'hash1': "hash"}, -5])
  end

end
