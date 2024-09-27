require './class_student.rb'
require './class_student_short.rb'

def main
  begin
    student1 = Student.new('Каупервуд', 'Фрэнк', 'Алджернон', id: 1, phone_number: "+1 (455) 197-70-35", telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "https://github.com/Cowperwood/")
    puts student1

    student2 = Student.new('Мартин', 'Роберт', 'Сесил', id: 2, telegram: '@RMartin', phone_number: '+1 (689) 145-98-46')
    puts student2

    student3 = Student.new('Торвальдс', 'Линус', 'Бенедикт', id: 3, phone_number: '+358 (123) 148-89-48', telegram: '@LinuxTorvalds', git: 'https://github.com/torvalds')

    puts student3

    student3.set_contacts(telegram: '@bruh')

    puts student3.getInfo

    puts student3.get_git_and_contact

    puts student3.get_name

    student_short1 = Student_short.new(student1)

    puts student_short1

    student_short2 = Student_short.new('2', 'Иван И.И. https://github.com/ivan +7(905)4045754')

    puts student_short2

    puts student.is_phone_number_valid? ("+7 (905) 404 5754")

  rescue => err
    puts err
  end

end

main()
