require './class_student.rb'
require './class_student_short.rb'

def main
  begin

    student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', id: 1, phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

    puts student1.to_str
   
    student_short1 = Student_Short.create_from_student(student1)

    puts student_short1

    student_short2 = Student_Short.create_from_string(1, 'Белокобыльский Б.В. github.com/bagdad1970/ +7 (905) 404-57-54')

    puts student_short2

=begin

    student_array = Student.read_from_txt("./student_write.txt")

    puts student_array

    Student.write_to_txt("./student_write.txt", student_array)
=end

  rescue => err
    puts err

  end

end

main()
