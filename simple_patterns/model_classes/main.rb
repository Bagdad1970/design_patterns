require './data_table.rb'
require './data_list.rb'
require './data_list_student_short.rb'
require './student.rb'
require './student_list_txt.rb'

def main
  begin

=begin
    data_table = Data_Table.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

    puts data_table

    data_list = Data_List.new(['eifhei', 'hello', 'hi', 'bruh'])

    data_list.select(1)
    data_list.select(2)

    puts data_list.get_selected

    puts data_list

    student_short1 = Student_Short.new(name: 'Каупервуд Ф.А.', contact: "@CowperwoodFinance", git: "github.com/Cowperwood/")

    student_short2 = Student_Short.new(name: 'Мартин Р.С.', git: "github.com/robert_martin/", contact: '+1(123)554-78-93')

    student_short3 = Student_Short.new(name: 'Белокобыльский Б.В.', git: "github.com/bagdad1970/", contact: '+7(905)505-57-54')

    student_short4 = Student_Short.new(name: 'Жиллиман Р.Г.', git: "github.com/space_marine/", contact: 'RoboutEmperium@gmail.com')

    data_list_student_short = Data_List_Student_Short.new([student_short1, student_short2])
    puts data_list_student_short.get_data_table_with_values_by_names

    data_list_student_short.sorted_array = [student_short3, student_short4]
    puts data_list_student_short.get_data_table_with_values_by_names
=end

    student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', id: 1, phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

    student2 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06', id: 2)

    student3 = Student.new(surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31', id: 3)

    student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1', id: 4)

    student_array = [student1, student2, student3, student4]
    student_list_txt = Student_List_TXT.new(filepath: './output_student_list_txt')
    student_list_txt.read_from_txt()

    student_list_txt.write_to_txt(student_array)

    puts student_list_txt

    puts student_list_txt.get_student_by_id(1)

  rescue => error
    puts error

  ensure
    puts "\nВыполнение завершено"
  end

end

main
