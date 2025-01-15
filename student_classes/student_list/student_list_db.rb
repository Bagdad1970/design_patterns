require_relative '../client_database.rb'
require_relative '../output_classes/data_table.rb'
require_relative 'istudent_list'

class Student_List_DB < IStudent_List

  attr_accessor :client_db

  def initialize(host: , username:, password: , database:)
    begin
      self.client_db = Client_DB.get_instance(host: host, username: username, password: password, database: database)
    rescue
      raise
    end
  end

  private :client_db

  def get_student_by_id(required_id)
    self.client_db.select_student_by_id(required_id)
  end

  def get_k_n_student_short_list(page:, amount_rows: 20, data_list: nil, filter: nil)
    begin
      student_array = self.client_db.select_k_n_students(page: page, amount_rows: amount_rows, filter: filter)
      student_short_array = student_array.each_with_object([]) {|student, array| array.append(Student_Short.create_from_hash(student))}
      return Data_List_Student_Short.new(student_short_array)
    rescue
      raise
    end
  end

  def add_student(student)
    self.client_db.insert_student(student)
  end

  def replace_student_by_id(required_id, new_student)
    self.client_db.update_student_by_id(required_id, new_student)
  end

  def delete_student_by_id(required_id)
    self.client_db.delete_student_by_id(required_id)
  end

  def get_student_count(filter: nil)
    self.client_db.get_student_count(filter: filter)
  end

  def custom_query(custom_query)
    self.client_db.custom_query(custom_query)
  end

  def close_connection
    self.client_db.close
  end

end

