require './data_table.rb'
require './data_list.rb'
require './data_list_student_short.rb'

def main
  begin
    data_table = Data_Table.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

    puts data_table

    data_list = Data_List.new(['eifhei', 'hello', 'hi', 'bruh'])

    data_list.select(1)
    data_list.select(2)

    puts data_list.get_selected

    puts data_list

    student_short1 = Student_Short.new(name: 'Каупервуд Ф.А.', contact: "@CowperwoodFinance", git: "github.com/Cowperwood/")

    student_short2 = Student_Short.new(name: 'Белокобыльский Б.В.', git: "github.com/bagdad1970/", contact: 'Bogdan@mail.ru')

    student_short3 = Student_Short.new(name: 'Белокобыльский Б.В.', git: "github.com/bagdad1970/", contact: '+7(905)505-57-54')

    data_list_student_short = Data_List_Student_Short.new([student_short1, student_short2, student_short3])

    puts data_list_student_short.get_data

  rescue => error
    puts error

  ensure
    puts "\nВыполнение завершено"
  end

end

main
