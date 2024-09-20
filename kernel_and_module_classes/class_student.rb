class Student
 
  attr_accessor :surname, :firstname, :lastname, :id, :phone_number, :telegram, :email, :git

  def initialize(surname, firstname, lastname, id: nil, phone_number: nil, telegram: nil, email: nil, git: nil)
    @surname = surname
    @firstname = firstname
    @lastname = lastname
    @id = id

    if Student.is_phone_number_valid? (phone_number)
      @phone_number = phone_number
    else
      raise ArgumentError.new("Неверный номер телефона для пользователя #{@id} #{@surname} #{@lastname} #{@firstname}")
    end

    @telegram = telegram
    @email = email
    @git = git

  end

  def Student.is_phone_number_valid?(checked_phone_number)
    phone_number_reg = /^\+?\d\s?\(?\s*\d{3}\s*\)?\s?\d{3}\-{0,1}\d{2}\-{0,1}\d{2}\s*$/
  
    return checked_phone_number =~ phone_number_reg

  end

  def to_s
    "#{@id} ФИО: #{@surname} #{@firstname} #{@lastname}.\nДанные для связи:\nНомер телефона: #{@phone_number}\nТелеграм: #{@telegram}\nEmail: #{@email}\nGit: #{git}\n\n"
  end

end
