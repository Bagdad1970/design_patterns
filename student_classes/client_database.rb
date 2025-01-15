require 'mysql2'

class Client_DB

  @instance_db = nil

  attr_accessor :client

  def initialize(host: , username:, password: , database:)
    self.client = nil

    (1..10).each do |attempt|
      begin
        self.client = Mysql2::Client.new(host: host, username: username, password: password, database: database)
        break
      rescue => error
        sleep(1) 
      end
    end

    raise DataBaseConnectionError.new if self.client.nil?
  end

  private_class_method :new

  private :client=

  def Client_DB.get_instance(host: , username: , password:, database:)
    begin
      @instance_db ||= self.new(host: host, username: username, password: password, database: database)
    rescue
      raise
    end
  end

  def select_student_by_id(required_id)
    self.client.query("SELECT * FROM STUDENTS WHERE ID = #{required_id}").first
  end

  def select_k_n_nonfiltered_students(page:, amount_rows: 20)
    begin
      student_array = self.client.query("SELECT * FROM STUDENTS LIMIT #{amount_rows} OFFSET #{(page - 1) * amount_rows};", :symbolize_keys => true).to_a
      return student_array
    rescue
      raise
    end
  end

  def get_filter_condition(filter)
    filter_names = filter.filter_names
    filter_conditions = Array.new()

    if filter_names.include? ('HasGitFilter')
      filter_conditions << "GIT IS NOT NULL"
    end

    if filter_names.include? ('HasContactFilter')
      filter_conditions << "TELEGRAM IS NOT NULL"
      filter_conditions << "PHONE_NUMBER IS NOT NULL"
      filter_conditions << "EMAIL IS NOT NULL"
    end

    return filter_conditions.join(" AND ")
  end

  def select_k_n_filtered_students(filter:, page:, amount_rows: 20)
    begin
      student_array = self.client.query("SELECT * FROM STUDENTS WHERE #{get_filter_condition(filter)} LIMIT #{amount_rows} OFFSET 0;", :symbolize_keys => true).to_a
      return student_array
    rescue
      raise
    end
  end

  def select_k_n_students(page:, amount_rows: 20, filter: nil)
    begin
      if page <= 0
        raise ArgumentError.new('Недопустимый номер страницы')
      elsif amount_rows < 0
        raise ArgumentError.new('Недопустимое количество записей')
      end

      if filter.nil?
        return select_k_n_nonfiltered_students(page: page, amount_rows: amount_rows)
      else
        return select_k_n_filtered_students(filter: filter, page: page, amount_rows: amount_rows)
      end
    rescue
      raise 
    end
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

  def get_student_count(filter: nil)
    if filter.nil?
      return self.client.query("SELECT COUNT(*) AS count FROM STUDENTS;").first['count']
    else
      return self.client.query("SELECT COUNT(*) AS count FROM STUDENTS WHERE #{get_filter_condition(filter)};").first['count']
    end
  end

  def custom_query(custom_query)
    self.client.query(custom_query)
  end

  def close
    self.client.close
  end

end

