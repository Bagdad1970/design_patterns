require './data_table.rb'

def main
  begin
    data_table1 = Data_Table.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

    puts data_table1[1,2]

    puts data_table1

    
  rescue => error
    puts error
  ensure
    puts 'Работа завершена'
  end


end

main
