require 'mysql2'

class Student_List_DB

  attr_accessor :client

  def initialize(host: , username:, password: , database:)
    self.client = Mysql2::Client.new(:host => host, :username => username, :password => password, :database => database)
  end

  private :client=

  def get_student_by_id(required_id)
    return self.client.query("SELECT * FROM STUDENTS WHERE STUDENT_ID = #{required_id}").first
  end

end

