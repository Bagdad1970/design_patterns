require_relative 'istudent_list'

class Student_List < IStudent_List

  attr_accessor :client

  private :client

  def initialize(client)
    self.client = client
  end

  def get_student_by_id(required_id)
    self.client.get_student_by_id(required_id)
  end

  def get_k_n_student_short_list(page:, amount_rows: 20, data_list: nil)
    self.client.get_k_n_student_short_list(page: page, amount_rows: amount_rows, data_list: data_list) 
  end

  def add_student(student)
    self.client.add_student(student)
  end

  def replace_student_by_id(required_id, new_student)
    self.client.replace_student_by_id(required_id, new_student)
  end

  def delete_student_by_id(required_id)
    self.client.delete_student_by_id(required_id)
  end

  def get_student_count
    self.client.get_student_count
  end

end

