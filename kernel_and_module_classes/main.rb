require './class_student.rb'

def main
  begin

    student1 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', id: 1, phone_number: '+7 (905) 404-57-54', telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "github.com/Cowperwood/")

    puts student1
    
    student_short = Student_Short.new(student1)

    puts student_short

    student_short2 = Student_Short.new(1, 'surname: Белокобыльский; firstname: Богдан; lastname: Витальевич; git: github.com/bagdad1970/; phone_number: +7 (905) 404-57-54')

    puts student_short2

    students_array = Student.read_from_txt("./student.txt")

    puts students_array
    

  rescue => err
    puts err

  end

end

main()
