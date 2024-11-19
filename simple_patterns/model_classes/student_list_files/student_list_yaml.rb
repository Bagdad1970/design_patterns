require_relative '../student_list_strategy'
require 'yaml'

class Student_List_YAML < Student_List_Strategy

  def read_from_file(filepath)
    yaml_data = YAML.safe_load(File.read(filepath), permitted_classes: [Date, Symbol])

    student_array = []
    
    yaml_data.map.each do |yaml_student|
      new_student = Student.create_from_hash(yaml_student)
      student_array.append(new_student) unless student_array.include?(new_student)
    end

    return student_array
  end

  def write_to_file(filepath, student_array, writing_mode = 'w')
    hash_student_array = student_array.map(&:to_hash)

    File.open(filepath, writing_mode) do |file|
      file.write(YAML.dump(hash_student_array)) 
    end
  end

end
