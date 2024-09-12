def favourite_lang
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

  print "\n"

end

def ruby_command
  print "Введите команду на языке Ruby: "
  ruby_instruction = STDIN.gets.chomp
  eval(ruby_instruction)

  print "\n"

end

def os_command
  print "Введите команду ОС: "
  system_instruction = STDIN.gets.chomp

  system(system_instruction)

  print "\n"

end


def main
  favourite_lang
  ruby_command
  os_command

end

main()




