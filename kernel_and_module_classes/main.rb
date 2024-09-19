require './class_student.rb'


student1 = Student.new('Каупервуд', 'Фрэнк', 'Алджернон', id: 1, phone_number: "+1 (455) 197-70-35", telegram: "@CowperwoodFinance", email: "CowperwoodF@gmail.com", git: "https://github.com/Cowperwood/")

student2 = Student.new('Мартин', 'Роберт', 'Сесил', id: 2, telegram: '@RMartin', phone_number: '+1 (576) 145-98-46')

student3 = Student.new('Торвальдс', 'Линус', 'Бенедикт', id: 3, phone_number: '+358 (567) 148-89-45', telegram: '@LinuxTorvalds', git: 'https://github.com/torvalds/linux')

puts student1
puts student2
puts student3
