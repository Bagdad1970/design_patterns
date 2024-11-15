require './output_classes/data_table.rb'
require './output_classes/data_list.rb'
require './output_classes/data_list_student_short.rb'
require './student_list_files/student_list_json.rb'
require './student_list_files/student_list_txt.rb'
require './student_list_files/student_list_yaml.rb'
require './entities/student.rb'
require './entities/student_short.rb'
require './student_list_context.rb'
require './student_list_db.rb'

def execute_data_list_data_table
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

end


def execute_student_list_txt
  student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

  student2 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06')

  student3 = Student.new(surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31')

  student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')
    
  student_array = [student1, student2, student3, student4]

  txt_strategy = Student_List_TXT.new

  student_list_txt = Student_List_Context.new(filepath: './output_txt', strategy: txt_strategy, student_array: student_array)
  
  student_list_txt.write_to_file

  student_list_txt.read_from_file
  puts student_list_txt.get_k_n_student_short_list(page: 1)

  puts student_list_txt.sort_by_name
  student_list_txt.add_student(Student.new(surname: 'Фамилия', firstname: 'Имя', lastname: 'Отчество', birthdate: '2000/12/12'))
  student_list_txt.replace_student_by_id(1, student4)
  student_list_txt.delete_student_by_id(4)
  puts student_list_txt.get_student_short_count
end

def execute_student_list_json

  student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

  student2 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06')

  student3 = Student.new(surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31')

  student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')

  student_array = [student1, student2, student3, student4]

  json_strategy = Student_List_JSON.new

  student_list_json = Student_List_Context.new(filepath: './output_json.json', strategy: json_strategy)

  #student_list_json.write_to_file

  student_list_json.read_from_file
  puts student_list_json.get_student_by_id(2)

  puts student_list_json.get_k_n_student_short_list(page: 1)

  puts student_list_json.sort_by_name

end

def execute_student_list_yaml
  student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

  student2 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06')

  student3 = Student.new(surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31')

  student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')
  
  student_array = [student1, student2, student3, student4]

  yaml_strategy = Student_List_YAML.new

  student_list_yaml = Student_List_Context.new(filepath: './output_yaml.yaml', strategy: yaml_strategy, student_array: student_array)

  student_list_yaml.write_to_file

  puts student_list_yaml.read_from_file

  puts student_list_yaml.get_student_by_id(2)

  puts student_list_yaml.get_k_n_student_short_list(page: 1)
  puts student_list_yaml.sort_by_name

end

def execute_student_list_db

  student_list_db = Student_List_DB.new(host: 'localhost', username: 'bagdad', password: '123', database: 'mysql')

  #result = student_list_db.client.query('SELECT * FROM STUDENTS')
  #result.each {|row| puts row}

  #p student_list_db.get_student_by_id(5)

  #p student_list_db.get_k_n_student_short_list(page: 2)

  student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000-12-12', phone_number: '+79054045754', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")


  #student_list_db.add_student(student1)

  #student_list_db.delete_student_by_id(31)

  #p student_list_db.get_student_count

  #student_list_db.replace_student_by_id(27, student1)

end


def main
  begin

    #execute_data_list_data_table
    
    #execute_student_list_txt

    #execute_student_list_json

    #execute_student_list_yaml

    execute_student_list_db
    
  rescue => error
    puts error

  ensure
    puts "\nВыполнение завершено"
  end

end

main
