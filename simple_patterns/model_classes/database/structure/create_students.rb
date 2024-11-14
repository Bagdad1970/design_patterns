require 'mysql2'

def connect_to_db(host: , username:, password: , database:)
  client = Mysql2::Client.new(:host => host, :username => username, :password => password, :database => database)
  return client
end

def create_students(client)
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

def main()

  client = connect_to_db(host: 'localhost', username: 'bagdad', password: '123', database: 'mysql')

  create_students(client)

end

main
