require_relative '../entities/student_short.rb'
require_relative '../output_classes/data_list_student_short.rb'
require_relative '../output_classes/data_table.rb'
require_relative 'istudent_list'

class Student_List_File_Adapter < IStudent_List

  attr_accessor :adapter

  private :adapter

  def initialize(adapter)
    self.adapter = adapter
  end

  def get_student_by_id(required_id)
    self.adapter.get_student_by_id(required_id) 
  end

  def get_k_n_student_short_list(page:, amount_rows: 20, data_list: nil)
    self.adapter.get_k_n_student_short_list(page: page, amount_rows: amount_rows, data_list: data_list)
  end

  def add_student(new_student)
    self.adapter.add_student(new_student)
    self.adapter.write_to_file
  end

  def replace_student_by_id(required_id, new_student)
    self.adapter.replace_student_by_id(required_id, new_student)
    self.adapter.write_to_file
  end

  def delete_student_by_id(required_id)
    self.adapter.delete_student_by_id(required_id)
    self.adapter.write_to_file
  end

  def get_student_count
    self.adapter.get_student_count
  end

end
