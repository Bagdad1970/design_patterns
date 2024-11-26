require_relative 'output_classes/data_table.rb'
require_relative 'output_classes/data_list.rb'
require_relative 'output_classes/data_list_student_short.rb'
require_relative 'student_list_files/student_list_json.rb'
require_relative 'student_list_files/student_list_txt.rb'
require_relative 'student_list_files/student_list_yaml.rb'
require_relative 'entities/student.rb'
require_relative 'student_list/student_list_file_adapter.rb'
require_relative 'student_list/student_list_db.rb'
require_relative 'client_database.rb'
require_relative 'student_list/student_list.rb'

def execute_student_list_txt
  student1 = Student.new(id: 1, surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")
  student2 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06')
  student3 = Student.new(id: 4, surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31')
  student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1', telegram: '@bruh123')
  student5 = Student.new(id: 12, surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1', telegram: '@bruh123')

  student_array = [student1, student2, student3, student4, student5]

  student_list_txt = Student_List_File_Adapter.new(filepath: './output_txt.txt', strategy: Student_List_TXT.new, student_array: student_array)

  student_list_client = Student_List.new(student_list_txt)

  #p student_list_client.get_student_count

  student6 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')

=begin
  student7 = Student.new(id: 10, surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31')
  student_list_client.add_student(student6)
  student_list_client.add_student(student7)

  p student_list_client
=end

  #puts student_list_client.get_k_n_student_short_list(page: 1)

  student_list_client.add_student(Student.new(surname: 'Фамилия', firstname: 'Имя', lastname: 'Отчество', birthdate: '2000/12/12'))

  student_list_client.replace_student_by_id(1, student6)

  p student_list_client

  student_list_client.delete_student_by_id(4)

  p student_list_client

end

def execute_student_list_json

  student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

  student2 = Student.new(id: 2, surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06')

  student3 = Student.new(surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31')

  student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')

  student5 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

  student_array = [student1, student2, student3, student4, student5]

  student_list_json = Student_List_File_Adapter.new(filepath: './output_json.json', strategy: Student_List_JSON.new, student_array: student_array)

  student_list = Student_List.new(student_list_json)

  #puts student_list.get_student_by_id(2)

  #puts student_list.get_k_n_student_short_list(page: 1, amount_rows: 3)

  student6 = Student.new(id: 10, surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')

  student_list.add_student(student6)

  student7 = Student.new(id: 10, surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31', telegram: @Batler2010)
  student_list.replace_student_by_id(3, student7)

  student_list.delete_student_by_id(10)

  p student_list.get_student_count

end

def execute_student_list_yaml
  student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

  student2 = Student.new(id: 2, surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06')

  student3 = Student.new(surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31')

  student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')

  student5 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '2000/12/12', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")
  
  student_array = [student1, student2, student3, student4, student5]

  student_list_yaml = Student_List_File_Adapter.new(filepath: './output_yaml.yaml', strategy: Student_List_YAML.new, student_array: student_array)

  student_list = Student_List.new(student_list_yaml)

  puts student_list.get_student_by_id(2)

  puts student_list.get_k_n_student_short_list(page: 1, amount_rows: 3)

  student6 = Student.new(id: 10, surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1')

  student_list.add_student(student6)

  student7 = Student.new(id: 10, surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31', telegram: @Batler2010)
  student_list.replace_student_by_id(3, student7)

  student_list.delete_student_by_id(10)

  p student_list.get_student_count
end

def execute_student_list_db
  student_list_db = Student_List_DB.new(host: 'localhost', username: 'bagdad', password: '123', database: 'mysql')
  student_list = Student_List.new(student_list_db)

  p student_list.get_student_count

  p student_list_db.get_k_n_student_short_list(page: 2, amount_rows: 5)

  #student6 = Student.new(id: 10, surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31', telegram: @Batler2010)
  #student_list.add_student(student6)

  #student_list.delete_student_by_id(30)
  #p student_list.get_student_count

end


def main
  begin

    #execute_data_list_data_table
    
    execute_student_list_txt

    execute_student_list_json

    execute_student_list_yaml

    execute_student_list_db
    
  rescue => error
    puts error

  ensure
    puts "\nВыполнение завершено"
  end

end

main
