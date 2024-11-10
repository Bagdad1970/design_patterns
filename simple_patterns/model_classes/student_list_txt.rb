require './student.rb'
require './student_short.rb'
require './data_list_student_short.rb'

class Student_List_TXT

  attr_accessor :filepath
  attr_reader :student_array

  def initialize(filepath: , student_array: nil)
    self.filepath = filepath
    self.student_array = student_array
  end

=begin
  def []=(index, student)
    if index < 0 or index >= self.student_array.size
      raise IndexError.new('Неверный индекс')
    elsif student.is_a? (Student) == false
      raise ArgumentError.new('Неверный тип входного значения')
    end

    self.student_array[index] = student
  end

  private :[]=
=end

  def student_array=(student_array)
    if student_array.nil? or student_array.is_a? (Array)
      @student_array = student_array
    else
      raise TypeError.new('Неверный тип входных данных')
    end
  end

  private :filepath=, :student_array=

  def read_from_txt
    student_array = Array.new()

    File.open(self.filepath, 'r') do |file|
      file.each_line do |line|
        line.chomp!

        if !(line.empty?)
          student_array.append(Student.create_from_string(line))
        end
      end
    end

    self.student_array = student_array
  end

  def write_to_txt(student_array, writing_mode = 'a')
    file = File.new(self.filepath, 'a')

    student_array.each do |student|
      file.puts(student.to_file)
    end

    file.close
  end

  def get_student_by_id(required_id)
    return self.student_array.find{|student| student.id == required_id}
  end

  def get_k_n_student_short_list(page:, amount_rows: 20, data_list: nil)
    if page <= 0
      raise ArgumentError.new('Недопустимый номер страницы')
    elsif amount_rows < 0
      raise ArgumentError.new('Недопустимое количество записей')
    end

    student_short_array = self.student_array.each_with_object([]) {|student, array| array.append(Student_Short.create_from_student(student))}

    start_index = (page-1) * amount_rows
    end_index = [start_index + amount_rows - 1, student_short_array.size - 1].min

    data_list = Data_List_Student_Short.new(student_short_array[start_index..end_index])

    return data_list 
  end

  def sort_by_name
    return self.student_array.sort_by {|student| student.get_name}
  end

  def add_student(student)
    self.student_array.append(student)
  end

  def replace_student_by_id(required_id, new_student)
    index = self.student_array.find_index {|student| student.id == required_id}
    self.student_array[index] = new_student
  end

  def delete_student_by_id(required_id)
    self.student_array.delete_if {|student| student.id == required_id}
  end

  def get_student_short_count
    self.student_array.size
  end

end
