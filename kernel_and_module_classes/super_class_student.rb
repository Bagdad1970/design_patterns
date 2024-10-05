class Person

  attr_accessor :id
  attr_reader :surname, :firstname, :lastname, :git

  def initialize(surname:, firstname:, lastname:, id:, git: )
    self.surname = surname
    self.firstname = firstname
    self.lastname = lastname
    self.id = id
    self.git = git
  end

  def surname=(surname)
    if Person.is_name_valid? (surname)
      @surname = surname
    else
      raise ArgumentError.new("Неверная фамилия студента: #{@id}")
    end
  end

  def firstname=(firstname)
    if Person.is_name_valid? (firstname)
      @firstname = firstname
    else
      raise ArgumentError.new("Неверная фамилия студента: #{@id}")
    end
  end

  def lastname=(lastname)
    if Person.is_name_valid? (lastname)
      @lastname = lastname
    else
      raise ArgumentError.new("Неверная фамилия студента: #{@id}")
    end
  end

  def git=(git)
    if git.nil? or Person.is_git_valid? (git)
      @git = git
    else
      raise ArgumentError.new("Неверный git: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end
  end

  private :surname=, :firstname=, :lastname=, :git=

  def Person.is_phone_number_valid? (checked_phone_number)
    phone_number_reg = /^\+?\d{1,3}\s?\(?\s*\d{3}\s*\)?\s?\d{3}\-{0,1}\d{2}\-{0,1}\d{2}\s*$/
  
    return checked_phone_number =~ phone_number_reg
  end

  def Person.is_email_valid? (checked_email)
    email_reg = /^[A-Za-z0-9._-]+\@[A-Za-z0-9._-]{0,5}mail\.[A-Za-z0-9._-]+/

    return checked_email =~ email_reg
  end

  def Person.is_name_valid? (checked_name)
    name_reg = /^[A-Za-zА-Яа-я]+$/

    return checked_name =~ name_reg
  end

  def Person.is_git_valid? (checked_git)
    git_reg = /^github\.com\/[A-Za-z0-9._-]+\/?$/

    return checked_git =~ git_reg
  end

  def Person.is_telegram_valid? (checked_telegram)
    telegram_reg = /^@[A-Za-z0-9_]{5,20}$/

    return checked_telegram =~ telegram_reg
  end

  def has_git?
    if self.git.nil?
      return false
    end

    return true
  end

  def get_name
    "#{@surname} #{@firstname[0].upcase}.#{@lastname[0].upcase}." 
  end

  def get_git
    "#{@git}"
  end

  def get_id
    "#{@id}"
  end

  public :has_git?, :get_name, :get_git, :get_id

end


class Student < Person
 
  attr_reader :telegram, :email, :phone_number

  def initialize(surname:, firstname:, lastname:, id: nil, phone_number: nil, telegram: nil, email: nil, git: nil)
    super(surname: surname, firstname: firstname, lastname: lastname, id: id, git: git)
    set_contacts(phone_number: phone_number, email: email, telegram: telegram)

  end

  def phone_number=(phone_number)
    if phone_number.nil? or Student.is_phone_number_valid? (phone_number)
      @phone_number = phone_number.gsub(' ', '')
    else
      raise ArgumentError.new("Неверный номер телефона студента: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end

  end

  def email=(email)
    if email.nil? or Student.is_email_valid? (email)
      @email = email 
    else
      raise ArgumentError.new("Неверный адрес электронной почты: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end

  end

  def telegram=(telegram)
    if telegram.nil? or Student.is_telegram_valid? (telegram)
      @telegram = telegram
    else
      raise ArgumentError.new("Неверный telegram: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end
  end

  private :phone_number=, :email=, :telegram=

  def Student.params_from_string(str)
    if str.empty? || str.nil?
      raise ArgumentError.new("Строка параметров пустая")
    end

    begin
      student_init = {}

      str.split(';').each do |param|
      
        key, value = param.strip.split(':').map(&:strip)

        case key.downcase
          when 'surname'
            student_init[:surname] = value
          when 'firstname'
          student_init[:firstname] = value
          when 'lastname'
          student_init[:lastname] = value
          when 'id'
            student_init[:id] = value
          when 'phone_number'
            student_init[:phone_number] = value
          when 'telegram'
            student_init[:telegram] = value
          when 'email'
            student_init[:email] = value
          when 'git'
            student_init[:git] = value
        end

      end

      return student_init

    rescue => error
      puts error.message

    end
  end

  def Student.create_from_string(str)
    parsed_string = Student.params_from_string(str)
    self.new(**parsed_string)
  end

  def Student.read_from_txt(filepath)
    student_array = Array.new()

    File.open(filepath, 'r') do |file|
      file.each_line do |line|
        line.chomp!

        if !(line.empty?)
          student_array.append(Student.create_from_string(line))
        end
      end

    end

    return student_array
  end

  def Student.write_to_txt(filepath, student_array)
    file = File.new(filepath, 'w')

    student_array.each do |student|
      file.puts(student.to_str)
    end

    file.close
  end

  def has_contact?
    if self.phone_number.nil? and self.email.nil? and self.telegram.nil?
      return false
    end

    return true
  end

  def set_contacts(hash_contacts)
    self.phone_number = hash_contacts[:phone_number]
    self.email = hash_contacts[:email]
    self.telegram = hash_contacts[:telegram]
  end

  def get_contact
    contact_info = nil

    if !(self.phone_number.nil?)
      contact_info = @phone_number
    elsif !(self.email.nil?)
      contact_info = @email
    elsif !(self.telegram.nil?)
      contact_info = @telegram
    end

    return contact_info

  end

  def get_git_and_contact
    "#{self.get_git} #{self.get_contact}"
  end

  def getInfo
    "#{self.get_name} #{self.get_git_and_contact}"
  end

  def to_s
    "#{@id} #{@surname} #{@firstname} #{@lastname}\nДанные для связи:\nНомер телефона: #{@phone_number}\nТелеграм: #{@telegram}\nEmail: #{@email}\nGit: #{@git}\n\n"
  end
  
  def to_str
    "id: #{@id}; surname: #{@surname}; firstname: #{@firstname}; lastname: #{@lastname}; phone_number: #{@phone_number}; telegram: #{@telegram}; email: #{@email}; git: #{git}"
  end

end


class Student_Short < Person

  attr_reader :name, :contact
  
  def initialize(id:, name:, git:, contact:)
    initials = name.split[1].split('.')
    surname, firstname, lastname = name.split[0], initials[0], initials[1]

    if id.nil?
      raise ArgumentError.new("Отсутствует id студента: #{surname} #{firstname}.#{lastname}.")
    end

    super(surname: surname, firstname: firstname, lastname: lastname, id: id, git: git)

    self.contact = contact

  end

  def contact=(contact)
    if contact.nil? or Person.is_phone_number_valid? (contact) or Person.is_email_valid? (contact) or Person.is_telegram_valid? (contact)
      @contact = contact
    else
      raise ArgumentError.new("Неверный контакт студента: #{@id} #{@name}")
    end
  end

  def Student_Short.create_from_string(id:, data:)
    student_short_init = {}

    params = Student_Short.parse_string_params(data)

    student_short_init[:id] = id
    student_short_init[:name] = params[0] + ' ' + params[1]
    student_short_init[:git] = params[2]
    student_short_init[:contact] = params[3..].join('')

    self.new(**student_short_init)

  end

  def Student_Short.create_from_student(student_obj)
    student_short_init = {}

    student_short_init[:id] = student_obj.get_id
    student_short_init[:name] = student_obj.get_name
    student_short_init[:git] = student_obj.get_git
    student_short_init[:contact] = student_obj.get_contact

    self.new(**student_short_init)

  end

  def self.parse_string_params(str_params)
    return str_params.split
  end

  def to_s
    "#{@id} #{self.get_name} #{self.get_git} #{@contact}"
  end

  def to_str
    "id: #{@id}; name: #{@name}; git: #{@git}; contact: #{@contact}"
  end

end
