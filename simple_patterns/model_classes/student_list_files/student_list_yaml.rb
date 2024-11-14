require_relative '../student_list_strategy'
require 'yaml'

class Student_List_YAML < Student_List_Strategy

  def read_from_file(filepath)
    yaml_data = YAML.safe_load(File.read(filepath), permitted_classes: [Date, Symbol])
    
    student_array = yaml_data.map {|yaml_student| Student.new(**yaml_student)}
    return student_array
  end

  def write_to_file(filepath, student_array, writing_mode = 'w')
    hash_student_array = student_array.map(&:to_hash)

    File.open(filepath, writing_mode) do |file|
      file.write(YAML.dump(hash_student_array)) 
    end
  end

end
