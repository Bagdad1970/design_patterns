require './class_student.rb'

def main
  begin
    student1 = Student.new('Каупервуд', 'Фрэнк', 'Алджернон', id: 1, phone_number: "+1 (455) 197-70-35", telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "https://github.com/Cowperwood/")
    puts student1

    student2 = Student.new('Мартин', 'Роберт', 'Сесил', id: 2, telegram: '@RMartin', phone_number: '+1 () 145-98-46')
    puts student2

    student3 = Student.new('Торвальдс', 'Линус', 'Бенедикт', id: 3, phone_number: '+358 (123) 148-89-4', telegram: '@LinuxTorvalds', git: 'https://github.com/torvalds/linux')

    puts student3
  rescue => err
    puts err
  end

end

main()
