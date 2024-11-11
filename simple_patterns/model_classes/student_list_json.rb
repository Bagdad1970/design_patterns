require './student.rb'
require './student_short.rb'
require './data_list_student_short.rb'
require 'json'

class Student_List_JSON

  attr_accessor :filepath
  attr_reader :student_array

  def initialize(filepath: , student_array: nil)
    self.filepath = filepath
    self.student_array = student_array
  end

  def student_array=(student_array)
    if student_array.nil? or student_array.is_a? (Array)
      @student_array = student_array
    else
      raise TypeError.new('Неверный тип входных данных')
    end
  end

  private :filepath=, :student_array=

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

  def get_student_by_id(required_id)
    return self.student_array.find{|student| student.id == required_id}
  end

end
