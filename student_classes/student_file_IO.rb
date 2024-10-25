require_relative 'student.rb'

def Student.read_from_txt(filepath)
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

def Student.write_to_txt(filepath, student_array)
  file = File.new(filepath, 'w')

  student_array.each do |student|
    file.puts(student.to_str)
  end

  file.close
end
