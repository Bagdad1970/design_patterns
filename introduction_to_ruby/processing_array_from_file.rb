require './array_methods.rb'

def read_file(filepath)
  if File.exist? (filepath)
    file = File.new(filepath, 'r:UTF-8')
    str_array = file.read
    file.close
  else
    puts "Файл не существует"
  end

  return str_array

end

def create_array(string_array)
  
  splitted_array = string_array.chomp.split

  for i in 0...(splitted_array.size) do
    splitted_array[i] = splitted_array[i].strip.to_f
  end

  return splitted_array

end


def main()
  chosen_method = ARGV[0].chomp
  str_array = read_file(ARGV[1])
  array = create_array(str_array)

  case chosen_method
    when 'min_elem' || 'min_elem()'
      puts "Минимальный элемент: #{min_elem(array)}"

    when 'first_positive_elem' || 'first_positive_elem()'
      puts "Индекс первого положительного элемента: #{first_positive_elem(array)}\n"
    
    else
      puts "Такого метода не существует"

  end

end

main()
