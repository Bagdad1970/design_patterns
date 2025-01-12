require './data_list_student_short.rb'
require '../entities/student_short.rb'
require '../entities/student.rb'

def main
  student_short1 = Student_Short.create_from_string(id: 1, data: 'Белокобыльский Б.В. github.com/Bagdad1970 +7(905)404-57-54')
  student_short2 = Student_Short.create_from_string(id: 2, data: 'Фамилия И.О. github.com/surname_ @bruh123')

  student_short_array = [student_short1, student_short2]

  data_list_student_short = Data_List_Student_Short.new(student_short_array)
  p data_list_student_short.get_data_table

end

main
