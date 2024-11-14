require_relative '../student_list_strategy'

class Student_List_TXT < Student_List_Strategy
  
  def read_from_file(filepath)
    student_array = Array.new()

    File.open(filepath, 'r') do |file|
      file.each_line do |line|
        line.chomp!

        if !(line.empty?)
          student_array.append(Student.create_from_string(line))
        end
      end
    end

    return student_array
  end

  def write_to_file(filepath, student_array, writing_mode = 'w')
    file = File.new(filepath, writing_mode)

    student_array.each do |student|
      file.puts(student.to_file)
    end

    file.close
  end

end
