require_relative '../student_list_strategy'

class Student_List_TXT < Student_List_Strategy
  
  def read_from_file(filepath)
    student_array = Array.new()

    current_id = 1
    File.open(filepath, 'r') do |file|
      file.each_line do |line|
        line.chomp!

        unless line.empty?
          line.sub!(/id:\s*\d+;/, "id: #{current_id};")
          new_student = Student.create_from_string(line)
          student_array.append(new_student) unless student_array.include?(new_student)

          current_id += 1
        end
      end
    end

    return student_array
  end

  def write_to_file(filepath, student_array, writing_mode = 'w')
    file = File.new(filepath, writing_mode)

    current_id = 1
    student_array.each do |student|
      student_hash = student.to_hash
      student_hash[:id] = current_id
      current_id += 1

      p student_hash
      student = Student.create_from_hash(student_hash)
      p student

      file.puts(student.to_file)
    end

    file.close
  end

end
