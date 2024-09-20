class Student
 
  attr_accessor :id, :telegram
  attr_reader :surname, :firstname, :lastname, :telegram, :email, :git, :phone_number 

  def initialize(surname, firstname, lastname, id: nil, phone_number: nil, telegram: nil, email: nil, git: nil)
    self.surname = surname
    self.firstname = firstname
    self.lastname = lastname
    @id = id
    self.phone_number = phone_number
    @telegram = telegram
    self.email = email
    self.git = git

  end

  def surname=(surname)
    if Student.is_name_valid? (surname)
      @surname = surname
    else
      raise ArgumentError.new("Неверная фамилия студента:\n#{@id}")
    end

  end

  def firstname=(firstname)
    if Student.is_name_valid? (surname)
      @firstname = firstname
    else
      raise ArgumentError.new("Неверное имя студента:\n#{@id} #{@surname}")
    end

  end

  def lastname=(lastname)
    if lastname.empty? or Student.is_name_valid? (lastname)
      @lastname = lastname
    else
      raise ArgumentError.new("Неверное отчество студента:\n#{@id} #{@surname} #{@firstname}")
    end

  end

  def phone_number=(phone_number)
    if phone_number.nil? or Student.is_phone_number_valid? (phone_number)
      @phone_number = phone_number
    else
      raise ArgumentError.new("Неверный номер телефона для студента:\n#{@id} #{@surname} #{@lastname} #{@firstname}")
    end

  end

  def email=(email)
    if email.nil? or Student.is_email_valid? (email)
      @email = email 
    else
      raise ArgumentError.new("Неверный адрес электронной почты:\n#{@id} #{@surname} #{@lastname} #{@firstname}")
    end
  end

  def git=(git)
    if git.nil? or Student.is_git_valid? (git)
      @git = git
    else
      raise ArgumentError.new("Неверный git:\n#{@id} #{@surname} #{@lastname} #{@firstname}")
    end
  end


  def Student.is_phone_number_valid? (checked_phone_number)
    phone_number_reg = /^\+?\d{1,3}\s?\(?\s*\d{3}\s*\)?\s?\d{3}\-{0,1}\d{2}\-{0,1}\d{2}\s*$/
  
    return checked_phone_number =~ phone_number_reg

  end

  def Student.is_email_valid? (checked_email)
    email_reg = /^[A-Za-z0-9._-]+\@[A-Za-z0-9._-]+\.[A-Za-z0-9._-]+/

    return checked_email =~ email_reg

  end

  def Student.is_name_valid? (checked_name)
    name_reg = /^[A-Za-zА-яа-я]+$/

    return checked_name =~ name_reg

  end

  def Student.is_git_valid? (checked_git)
    git_reg = /^(https|http):\/\/github.com\/[A-Za-z0-9._-]+\/?$/

    return checked_git =~ git_reg

  end

  def has_git?
    if self.git.nil?
      return false
    end

    return true

  end

  def has_contact?
    if self.phone_number.nil? and self.email.nil? and self.telegram.nil?
      return false
    end

    return true

  end

  def to_s
    "#{@id} #{@surname} #{@firstname} #{@lastname}.\nДанные для связи:\nНомер телефона: #{@phone_number}\nТелеграм: #{@telegram}\nEmail: #{@email}\nGit: #{git}\n\n"
  end

end
