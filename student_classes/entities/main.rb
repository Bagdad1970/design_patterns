require './person.rb'
require './student.rb'
require './student_short.rb'

student = Student.new(surname: "Белокобыльский", firstname: "Богдан", lastname: "Витальевич", birthdate: '2024-09-22', telegram: '@bruh123', email: 'BogdanBattle@mail.ru')
p student
puts student.get_contact

student_short1 = Student_Short.create_from_student(student)
p student_short1

student_short2 = Student_Short.create_from_string(id: 1, data: 'Белокобыльский Б.В. github.com/Bagdad1970 +7(905)404-57-54')
p student_short2
