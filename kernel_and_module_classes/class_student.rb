class Student
 
  attr_accessor :surname, :firstname, :lastname, :id, :phone_number, :telegram, :email, :git

  def initialize(surname, firstname, lastname, optional_contacts)
    @surname = surname
    @firstname = firstname
    @lastname = lastname
    @id = optional_contacts[:id]
    @phone_number = optional_contacts[:phone_number]
    @telegram = optional_contacts[:telegram]
    @email = optional_contacts[:email]
    @git = optional_contacts[:git]

  end

  def to_s
    "#{@id} ФИО: #{@surname} #{@firstname} #{@lastname} Данные для связи: #{@phone_number} #{@telegram} #{@email} #{git}"
  end

end
