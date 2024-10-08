require './person.rb'
require './student.rb'
require './student_file_IO.rb'
require './student_short.rb'

def main
  begin
    person = Person.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', id: 1, git: "github.com/Cowperwood/", contact: "@Bruh123")

    puts "Человек: #{person}"

    student1 = Student.new(id: 5, surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

    puts student1

    student2 = Student.new(id: 10, surname: 'Белокобыльский', firstname: 'Богдан', lastname: 'Витальевич', git: "github.com/bagdad1970/", email: 'Bogdan@mail.ru')

    puts student2
    
    student_short1 = Student_Short.create_from_student(student1)

    puts student_short1
    
    student_short2 = Student_Short.create_from_string(id: 2, data: "Каупервуд Ф.А. github.com/Cowperwood/ CowperwoordF@gmail.com")

    puts student_short2

=begin
    student_array = Array.new([student1, student2])
    p student_array

    Student.write_to_txt('./student.txt', student_array)

    student_array_txt = Student.read_from_txt('./student.txt')
    puts student_array_txt
=end

  rescue => err
    puts err

  end

end

main()
