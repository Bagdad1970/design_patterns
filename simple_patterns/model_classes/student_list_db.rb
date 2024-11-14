require 'mysql2'

class Student_List_DB

  @instance = nil

  def initialize(host: , username:, password: , database:)
    @client = Mysql2::Client.new(:host => host, :username => username, :password => password, :database => database)
  end

  def self.instance(host: , username:, password: , database:)
    @client ||= self.new(host: host, username: username, password: password, database: database) 
  end

  private_class_method :new

  def create_table_students

  end

end

def create_student()

  client = Mysql2::Client.new(:host => host, :username => username, :password => password, :database => database)

  client.query("CREATE TABLE IF NOT EXISTS STUDENTS (
                  STUDENT_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                  SURNAME VARCHAR(40) NOT NULL,
                  FIRSTNAME VARCHAR(40) NOT NULL,
                  LASTNAME VARCHAR(100) NOT NULL,
                  BIRTHDATE DATE NOT NULL,
                  PHONE_NUMBER VARCHAR(20) NULL,
                  TELEGRAM VARCHAR(35) NULL,
                  EMAIL VARCHAR(40) NULL,
                  GIT VARCHAR(40) NULL
                );"
              )

end

create_db(host: 'localhost', username: 'bagdad', password: '123', database: 'mysql')
