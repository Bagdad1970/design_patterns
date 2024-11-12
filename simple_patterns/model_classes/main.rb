require './data_table.rb'
require './data_list.rb'
require './data_list_student_short.rb'
require './student.rb'
require './student_list_txt.rb'
require './student_list_json.rb'
require './student_list_yaml.rb'

def execute_student_list_txt
  student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

  student2 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06')

  student3 = Student.new(surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31')

  student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')
    
  student_array = [student1, student2, student3, student4]

  student_list_txt = Student_List_TXT.new(filepath: './output_student_txt')
  student_list_txt.read_from_txt()

  puts student_list_txt.get_k_n_student_short_list(page: 1)

  student_list_txt.write_to_txt(student_array)
    
  puts student_list_txt.get_k_n_student_short_list(page: 1)

  puts student_list_txt.sort_by_name
  student_list_txt.add_student(Student.new(surname: 'Фамилия', firstname: 'Имя', lastname: 'Отчество', birthdate: '2000/12/12'))
  student_list_txt.replace_student_by_id(1, student4)
  student_list_txt.delete_student_by_id(4)
  puts student_list_txt.get_student_short_count

end

def execute_student_list_json

=begin
  student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

  student2 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06')

  student3 = Student.new(surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31')

  student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')

  student_array = [student1, student2, student3, student4]
=end

  student_list_json = Student_List_JSON.new(filepath: './output_json.json')

  student_list_json.read_from_file()
  puts student_list_json.get_student_by_id(2)

  puts student_list_json.get_k_n_student_short_list(page: 1)

  puts student_list_json.sort_by_name

  #student_list_json.write_to_file(student_array, writing_mode = 'w')
    

end

def execute_student_list_yaml
=begin
  student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

  student2 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06')

  student3 = Student.new(surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31')

  student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')
  
  student_array = [student1, student2, student3, student4]
=end

  student_list_yaml = Student_List_YAML.new(filepath: './output_yaml.yaml')

  puts student_list_yaml.read_from_file

  #student_list_yaml.write_to_file(student_array)


end


def main
  begin

    data_table = Data_Table.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

    puts data_table

    data_list = Data_List.new(['eifhei', 'hello', 'hi', 'bruh'])

    data_list.select(1)
    data_list.select(2)

    puts data_list.get_selected

    puts data_list
    
    student_short1 = Student_Short.create_from_string(id: 1, data: 'Каупервуд Ф.А. github.com/Cowperwood/ @CowperwoodFinance')

    student_short2 = Student_Short.create_from_string(id: 2, data: 'Мартин Р.С. github.com/robert_martin/ +1(123)554-78-93')

    student_short3 = Student_Short.create_from_string(id: 3, data: 'Белокобыльский Б.В. github.com/bagdad1970/ +7(905)505-57-54')

    student_short4 = Student_Short.create_from_string(id: 4, data: 'Жиллиман Р.Г. github.com/space_marine/ RoboutEmperium@gmail.com')

    data_list_student_short = Data_List_Student_Short.new([student_short1, student_short2])
    puts data_list_student_short.get_data_table_with_values_by_names

    data_list_student_short.sorted_array = [student_short3, student_short4]
    puts data_list_student_short.get_data_table_with_values_by_names

    #execute_student_list_txt

    #execute_student_list_json

    execute_student_list_yaml
    
  rescue => error
    puts error

  ensure
    puts "\nВыполнение завершено"
  end

end

main
