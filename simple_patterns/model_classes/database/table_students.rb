require 'mysql2'

def connect_to_db(host: , username:, password: , database:)
  client = Mysql2::Client.new(:host => host, :username => username, :password => password, :database => database)
  return client
end

def create_students(client, insert_filepath)
  create_command = File.read(create_filepath)

  client.query(create_command)
end

def insert_into_students(client, insert_filepath)
  insert_command = File.read(insert_filepath)

  client.query(insert_command)
end

def select_from_students(client)
  result = client.query('SELECT * FROM STUDENTS;')
  result.each {|row| puts row}
end

def main()
  client = connect_to_db(host: 'localhost', username: 'bagdad', password: '123', database: 'mysql')

  create_students(client, './structure/students.txt')

  insert_into_students(client, './data/students.txt')

  select_from_students(client)
end

main
