require_relative 'student_list'

require 'json'

class Student_List_JSON < Student_List

  def initialize(filepath:, student_array: nil)
    super(filepath: filepath, student_array: student_array)
  end

  def read_from_file
    json_data = JSON.parse(File.read(self.filepath), {symbolize_names: true})
    student_array_hash = json_data.map {|json_student| Student.new(**json_student)}

    self.student_array = student_array_hash
  end

  def write_to_file(student_array, writing_mode = 'w')
    student_array_hash = student_array.map(&:to_hash)

    File.open(self.filepath, writing_mode) do |file|
      file.write(JSON.pretty_generate(student_array_hash)) 
    end
  end

end
