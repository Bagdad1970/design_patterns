require './student.rb' 

class Student_List_TXT

  attr_accessor :filepath
  attr_reader :student_array

  def initialize(filepath: , student_array: nil)
    self.filepath = filepath
    self.student_array = student_array
  end

  def student_array=(student_array)
    if student_array.nil? or student_array.is_a? (Array)
      @student_array = student_array
    else
      raise TypeError.new('Неверный тип входных данных')
    end
  end

  private :filepath=, :student_array=

  def read_from_txt
    student_array = Array.new()

    File.open(self.filepath, 'r') do |file|
      file.each_line do |line|
        line.chomp!

        if !(line.empty?)
          student_array.append(Student.create_from_string(line))
        end
      end
    end

    self.student_array = student_array
  end

  def write_to_txt(student_array)
    file = File.new(self.filepath, 'w')

    student_array.each do |student|
      file.puts(student.to_file)
    end

    file.close
  end

  def get_student_by_id(required_id)
    return self.student_array.find{|student| student.id == required_id}
  end

end
