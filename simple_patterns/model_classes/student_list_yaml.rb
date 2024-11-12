require './student.rb'
require './student_short.rb'
require './data_list_student_short.rb'
require 'yaml'
require 'date'

class Student_List_YAML

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
    yaml_data = YAML.safe_load(File.read(self.filepath), permitted_classes: [Date, Symbol])
    
    student_array = yaml_data.map {|yaml_student| Student.new(**yaml_student)}
    self.student_array = student_array
  end

end
