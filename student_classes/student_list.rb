require_relative 'istudent_list.rb'


class Student_List < IStudent_List

  attr_accessor :client, :current_page, :observers, :max_page
  private :client

  def initialize(client)
    self.client = client
    self.observers = []
  end

  def subscribe(observer)
    self.observers.append(observer)
  end

  def get_student_by_id(required_id)
    self.client.get_student_by_id(required_id)
  end

  def get_k_n_student_short_list(page:, amount_rows:, data_list: nil, filter: nil)
    self.client.get_k_n_student_short_list(page: page, amount_rows: amount_rows, data_list: data_list, filter: nil)
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

  def get_student_count(filter: nil)
    self.client.get_student_count(filter: filter)
  end

end

