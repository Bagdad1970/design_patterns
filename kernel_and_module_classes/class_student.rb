class Student
 
  attr_reader :surname, :firstname, :lastname, :id, :phone_number, :telegram, :email, :git
  attr_writer :surname, :firstname, :lastname, :id, :phone_number, :telegram, :email, :git

  def initialize(surname, firstname, lastname, id = nil, phone_number = nil, telegram = nil, email = nil, git = nil)
    @surname = surname
    @firstname = firstname
    @lastname = lastname
    @id = id
    @phone_number = phone_number
    @telegram = telegram
    @email = email
    @git = git

  end

  def to_s
    "#{@id} ФИО: #{@surname} #{@firstname} #{@lastname} Данные для связи: #{@phone_number} #{@telegram} #{@email} #{git}"
  end

end
