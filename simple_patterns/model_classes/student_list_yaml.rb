require_relative 'student_list'

require 'yaml'

class Student_List_YAML < Student_List

  def initialize(filepath:, student_array: nil)
    super(filepath: filepath, student_array: student_array)
  end

  def read_from_file
    yaml_data = YAML.safe_load(File.read(self.filepath), permitted_classes: [Date, Symbol])
    
    student_array = yaml_data.map {|yaml_student| Student.new(**yaml_student)}
    self.student_array = student_array
  end

  def write_to_file(student_array, writing_mode = 'w')
    hash_student_array = student_array.map(&:to_hash)

    File.open(self.filepath, writing_mode) do |file|
      file.write(YAML.dump(hash_student_array)) 
    end
  end

end
