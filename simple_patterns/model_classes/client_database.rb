require 'mysql2'

class Client_DB

  @instance_db = nil

  attr_accessor :client

  def initialize(host: , username:, password: , database:)
    self.client = nil

    10.times do |attempt|
      begin
        self.client = Mysql2::Client.new(host: host, username: username, password: password, database: database)
        puts "Успешное пожключения на попытке #{attempt}"
        break
      rescue => error
        puts "Ошибка подключения на попытке #{attempt}: Ошибка: #{error}"
        sleep(1) 
      end
    end

    raise Mysql2::Error::ConnectionError.new("Не удалось подключиться к базе данных") if self.client.nil?
  end

  private_class_method :new

  private :client=

  def Client_DB.get_instance(host: , username: , password:, database: )
    @instance_db ||= self.new(host: host, username: username, password: password, database: database)
  end

  def select_student_by_id(required_id)
    self.client.query("SELECT * FROM STUDENTS WHERE ID = #{required_id}").first
  end

  def select_k_n_students(page:, amount_rows: 20)
    if page <= 0
      raise ArgumentError.new('Недопустимый номер страницы')
    elsif amount_rows < 0
      raise ArgumentError.new('Недопустимое количество записей')
    end

    student_array = self.client.query("SELECT * FROM STUDENTS LIMIT #{amount_rows} OFFSET #{(page - 1) * amount_rows};", :symbolize_keys => true).to_a
  end

  def insert_student(student)
    self.client.query("INSERT INTO STUDENTS (surname, firstname, lastname, birthdate, phone_number, telegram, email, git)
      VALUES ('#{student.surname}', '#{student.firstname}', '#{student.lastname}', '#{student.birthdate}', '#{student.phone_number}', '#{student.telegram}', '#{student.email}', '#{student.git}')")
  end

  def update_student_by_id(required_id, new_student)
    self.client.query("UPDATE STUDENTS SET
                       surname = '#{new_student.surname}',
                       firstname = '#{new_student.firstname}',
                       lastname = '#{new_student.lastname}',
                       birthdate = '#{new_student.birthdate}',
                       phone_number = '#{new_student.phone_number}',
                       telegram = '#{new_student.telegram}',
                       email = '#{new_student.email}',
                       git = '#{new_student.git}'
                       WHERE id = #{required_id};"
                     )
  end

  def delete_student_by_id(required_id)
    self.client.query("DELETE FROM STUDENTS WHERE ID = #{required_id};")
  end

  def get_student_count
    self.client.query("SELECT COUNT(*) AS count FROM STUDENTS;").first['count']
  end

  def custom_query(custom_query)
    self.client.query(custom_query)
  end

  def close
    self.client.close
    puts "Соединения с базой данных закрыто"
  end

end

