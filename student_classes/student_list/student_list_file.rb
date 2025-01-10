require_relative '../entities/student_short.rb'
require_relative '../output_classes/data_list_student_short.rb'
require_relative '../output_classes/data_table.rb'
require_relative 'istudent_list'

class Student_List_File

  attr_accessor :filepath, :strategy

  private :strategy

  def initialize(filepath: , strategy:, student_array: nil)
    self.filepath = filepath
    self.student_array = student_array
    self.strategy = strategy
  end

  def student_array=(student_array)
    if student_array.nil?
      @student_array = []
    elsif student_array.is_a? (Array)
      unique_student_array = []
      student_array.each do |student|
        unique_student_array.append(student) unless unique_student_array.include?(student)
      end

      @student_array = unique_student_array
    else
      raise TypeError.new('Неверный тип входных данных')
    end
  end

  private :filepath=, :student_array=

  def read_from_file
    @student_array = self.strategy.read_from_file(self.filepath)
  end
  
  def write_to_file(writing_mode = 'w')
    self.strategy.write_to_file(self.filepath, @student_array, writing_mode)
  end

  def get_student_by_id(required_id)
    return @student_array.find{|student| student.id == required_id}
  end

  def get_k_n_student_short_list(page:, amount_rows: 20, data_list: nil)
    if page <= 0
      raise ArgumentError.new('Недопустимый номер страницы')
    elsif amount_rows < 0
      raise ArgumentError.new('Недопустимое количество записей')
    end

    start_index = (page-1) * amount_rows
    end_index = [start_index + amount_rows - 1, @student_array.size - 1].min

    student_short_array = @student_array[start_index..end_index].each_with_object([]) {|student, array| array.append(Student_Short.create_from_student(student))}

    return Data_List_Student_Short.new(student_short_array)
  end

  def sort_by_name
    return @student_array.sort_by {|student| student.get_name}
  end

  def get_new_id
    max_id = @student_array.reduce([]) {|student_ids, student| student_ids.append(student.id.to_i)}.max
    return max_id + 1
  end

  private :get_new_id

  def add_student(new_student)
    if @student_array.include?(new_student) == true
      raise ArgumentError.new('Такой студент уже существует')
    else
      student_hash = new_student.to_hash
      student_hash[:id] = self.get_new_id
      @student_array.append(Student.new(**student_hash))
    end
  end

  def replace_student_by_id(required_id, new_student)
    if @student_array.include?(new_student)
      raise ArgumentError.new('Такой студент уже существует')
    else
      index = @student_array.find_index {|student| student.id == required_id}
      @student_array[index] = new_student unless index.nil?
    end
  end

  def delete_student_by_id(required_id)
    @student_array.delete_if {|student| student.id == required_id}
  end

  def get_student_count
    @student_array.size
  end

end
