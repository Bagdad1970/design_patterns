require_relative 'student.rb'
require_relative 'binary_tree.rb'

def main
  begin

    student0 = Student.new(surname: 'Жиллиман', firstname: 'Робаут', lastname: 'Конорович', birthdate: '1004/09/22', id: 0)

    student1 = Student.new(surname: 'Белокобыльский', firstname: 'Богдан', lastname: 'Витальевич', birthdate: '2004/09/22', id: 1)

    student2 = Student.new(surname: 'Каупервуд', firstname: 'Фрэнк', lastname: 'Алджернон', birthdate: '1845/03/06', id: 2)

    student3 = Student.new(surname: 'Батлер', firstname: 'Эдвард', lastname: 'Мэлия', birthdate: '2010/12/31', id: 3)

    student4 = Student.new(surname: 'Атрейдес', firstname: 'Пол', lastname: 'Летович', birthdate: '1980/01/1', id: 4)

    student_array = [student0, student1, student2, student3, student4]

    tree = Binary_Tree.new(student_array)

    puts tree

  rescue => err
    puts err

  end

end

main()

