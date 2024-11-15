require 'mysql2'
require './output_classes/data_table.rb'

class Student_List_DB

  attr_accessor :client

  def initialize(host: , username:, password: , database:)
    self.client = Mysql2::Client.new(:host => host, :username => username, :password => password, :database => database)
  end

  private :client=

  def get_student_by_id(required_id)
    self.client.query("SELECT * FROM STUDENTS WHERE ID = #{required_id}").first
  end

  def get_k_n_student_short_list(page:, amount_rows: 20, data_list: nil)
    if page <= 0
      raise ArgumentError.new('Недопустимый номер страницы')
    elsif amount_rows < 0
      raise ArgumentError.new('Недопустимое количество записей')
    end

    student_array = self.client.query("SELECT * FROM STUDENTS LIMIT #{amount_rows} OFFSET #{(page - 1) * amount_rows};", :symbolize_keys => true).to_a

    student_short_array = student_array.each_with_object([]) {|student, array| array.append(Student_Short.create_from_hash(student))}

    data_list = Data_List_Student_Short.new(student_short_array)

    return data_list 
  end

  def add_student(student)
    self.client.query("INSERT INTO STUDENTS (surname, firstname, lastname, birthdate, phone_number, telegram, email, git)
      VALUES ('#{student.surname}', '#{student.firstname}', '#{student.lastname}', '#{student.birthdate}', '#{student.phone_number}', '#{student.telegram}', '#{student.email}', '#{student.git}')")
  end

  def delete_student_by_id(required_id)
    self.client.query("DELETE FROM STUDENTS WHERE ID = #{required_id};")
  end

  def get_student_count
    self.client.query("SELECT COUNT(*) AS count FROM STUDENTS;").first['count']
  end

end

