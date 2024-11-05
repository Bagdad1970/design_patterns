require './data_table.rb'
require './data_list.rb'

def main
  begin
    data_table = Data_Table.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

    puts data_table[1,2]

    puts data_table

    data_list = Data_List.new(['eifhei', 'hello', 'hi', 'bruh'])

    data_list.select(1)

    puts data_list[1]

    puts data_list

  rescue => error
    puts error

  ensure
    puts 'Выполнение завершено'
  end

end

main
