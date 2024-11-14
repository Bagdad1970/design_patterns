require 'mysql2'

class Student_List_DB

  attr_accessor :client

  def initialize(host: , username:, password: , database:)
    self.client = Mysql2::Client.new(:host => host, :username => username, :password => password, :database => database)
  end

  private :client=

end

