class Do_Homework

  attr_accessor :weariness

  def initialize
    self.weariness = 100
  end

  def read_book
    self.weariness -= 15
  end

  def to_blunt
    self.weariness += 5
  end

  def write_program
  end

  def take_a_look_at_documentaion
  end

  def watch_video
  end

  def solve_tasks
  end

  def do_homework
    read_book
    take_a_look_at_documentaion
    to_blunt
    watch_video
    to_blunt
    solve_tasks
    write_program

    puts "Усталость по окончании работы: #{weariness} из 100\n\n"
  end

end


class Do_Homerwork_Math_Analysis < Do_Homework

  def read_book
    self.weariness -= 25

    puts 'Прочитали Фихтенгольца'
  end

  def solve_tasks
    self.weariness -= 40

    puts 'Посчитали интеграл'
  end

  def watch_video
    self.weariness -= 10

    puts 'Посмотрели лекцию'
  end

end


class Do_Homerwork_Programming < Do_Homework

  def watch_video
    self.weariness -= 5

    puts 'Посмотрели видео'
  end

  def write_program
    self.weariness -= 30

    puts 'Написали HTML-дерево'
  end

  def take_a_look_at_documentaion
    self.weariness -= 5

    puts 'Посмотрели ruby doc'
  end

  def read_book
    self.weariness -= 15

    puts 'Прочитали Чистый Код'
  end

end

def main
  
  begin
    do_homework_programming = Do_Homerwork_Programming.new()
    do_homework_programming.do_homework

    do_homerwork_math_analysis = Do_Homerwork_Math_Analysis.new()
    do_homerwork_math_analysis.do_homework

  rescue => err
    puts err

  end

end

main
