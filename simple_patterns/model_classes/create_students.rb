require 'mysql2'

def connect_to_db(host: , username:, password: , database:)
  client = Mysql2::Client.new(:host => host, :username => username, :password => password, :database => database)
  return client
end

def main
  client = connect_to_db(host: 'localhost', username: 'bagdad', password: '123', database: 'mysql')
end

main
