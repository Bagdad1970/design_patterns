username = ARGV[0] 
puts "Привет, #{username}"

print "Ваш любимый язык программирования: " 
input_lang = STDIN.gets.chomp

lower_lang = input_lang.downcase


case lower_lang
    when "ruby" then puts "Не подлизывайся"
    when "c++" then puts "Крутой"
    when "python" then puts "Зумер"
    when "assembler" then puts "Бумер"
    else
        puts "Скоро Ruby станет любимым"
end

username = ARGV[0] 
puts "Привет, #{username}"

print "Ваш любимый язык программирования: " 
input_lang = STDIN.gets.chomp

lower_lang = input_lang.downcase


case lower_lang
    when "ruby" then puts "Не подлизывайся"
    when "c++" then puts "Крутой"
    when "python" then puts "Зумер"
    when "assembler" then puts "Бумер"
    else
        puts "Скоро Ruby станет любимым"
end

puts "Введите команду на языке Ruby:"
ruby_instruction = STDIN.gets.chomp
eval(ruby_instruction)

print "Теперь команду ОС: "
system_instruction = STDIN.gets.chomp

puts "Вывод команды ОС:"
system(system_instruction)

