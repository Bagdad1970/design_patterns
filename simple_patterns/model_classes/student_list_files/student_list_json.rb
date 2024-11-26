require_relative 'student_list_strategy'
require 'json'

class Student_List_JSON < Student_List_Strategy

  def read_from_file(filepath)
    json_data = JSON.parse(File.read(filepath), {symbolize_names: true})

    student_array = []

    current_id = 1
    json_data.map.each do |json_student|
      json_student[:id] = current_id
      new_student = Student.new(**json_student)
      student_array.append(new_student) unless student_array.include?(new_student)

      current_id += 1
    end

    return student_array
  end

  def write_to_file(filepath, student_array, writing_mode = 'w')
    hash_student_array = student_array.map(&:to_hash)

    current_id = 1
    hash_student_array.each do |hash_student|
      hash_student[:id] = current_id
      current_id += 1
    end

    File.open(filepath, writing_mode) do |file|
      file.write(JSON.pretty_generate(hash_student_array)) 
    end
  end

end
