require './student.rb' 

class Student_List_TXT

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

end