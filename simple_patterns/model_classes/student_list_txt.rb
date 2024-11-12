require_relative 'student_list'

class Student_List_TXT < Student_List

  def initialize(filepath:, student_array: nil)
    super(filepath: filepath, student_array: student_array)
  end

  def read_from_file
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

  def write_to_file(student_array, writing_mode = 'w')
    file = File.new(self.filepath, writing_mode)

    student_array.each do |student|
      file.puts(student.to_file)
    end

    file.close
  end

end
