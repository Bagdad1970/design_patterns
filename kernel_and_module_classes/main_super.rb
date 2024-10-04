require './super_class_student.rb'

def main
  begin
    person = Person.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', id: 1, git: "github.com/Cowperwood/")

    puts person

    student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

    puts student1
    
    student_short1 = Student_Short.create_from_student(student1)

    puts student_short1
    
    student_short2 = Student_Short.create_from_string(id: 2, data: "Каупервуд Ф.А. github.com/Cowperwood/ CowperwoordF@gmail.com")

    puts student_short2

  rescue => err
    puts err

  end

end

main()
