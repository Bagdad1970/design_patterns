require_relative '../student_list_strategy'
require 'json'

class Student_List_JSON < Student_List_Strategy

  def read_from_file(filepath)
    json_data = JSON.parse(File.read(filepath), {symbolize_names: true})
    student_array_hash = json_data.map {|json_student| Student.new(**json_student)}

    return student_array_hash
  end

  def write_to_file(filepath, student_array, writing_mode = 'w')
    student_array_hash = student_array.map(&:to_hash)

    File.open(filepath, writing_mode) do |file|
      file.write(JSON.pretty_generate(student_array_hash)) 
    end
  end

end
