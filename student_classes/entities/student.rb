require_relative 'person.rb'
require 'date'

class Student < Person

  include Comparable

  attr_reader :surname, :firstname, :lastname, :telegram, :email, :phone_number, :birthdate

  def initialize(surname:, firstname:, lastname:, birthdate:, id: nil, phone_number: nil, telegram: nil, email: nil, git: nil)
    self.birthdate = birthdate
    self.surname = surname
    self.firstname = firstname
    self.lastname = lastname
    set_contacts(phone_number: phone_number, email: email, telegram: telegram)

    super(id: id, git: git, contact: contacts)
  end

  def Student.create_from_hash(student_hash)
    self.new(surname: student_hash[:surname], firstname: student_hash[:firstname], lastname: student_hash[:lastname], id: student_hash[:id], birthdate: student_hash[:birthdate], phone_number: student_hash[:phone_number], telegram: student_hash[:telegram], email: student_hash[:email], git: student_hash[:git])
  end

  def <=>(other)
    if self.birthdate < other.birthdate
      return -1
    elsif self.birthdate == other.birthdate
      return 0
    else
      return 1
    end
  end

  def ==(other)
    if (!self.git.nil? && self.git == other.git) ||
      (!self.phone_number.nil? && self.phone_number == other.phone_number) ||
      (!self.email.nil? && self.email == other.email) ||
      (!self.telegram.nil? && self.telegram == other.telegram)
      return true
    else
      return false
    end
  end

  def contacts
    [@phone_number, @email, @telegram]
  end

  def surname=(surname)
    if !(surname.nil?) and Student.is_name_valid? (surname)
      @surname = surname
    else
      raise ArgumentError.new("Неверная фамилия студента: #{@id}")
    end
  end

  def firstname=(firstname)
    if !(firstname.nil?) and Student.is_name_valid? (firstname)
      @firstname = firstname
    else
      raise ArgumentError.new("Неверное имя студента: #{@id}")
    end
  end

  def lastname=(lastname)
    if !(lastname.nil?) and Student.is_name_valid? (lastname)
      @lastname = lastname
    else
      raise ArgumentError.new("Неверное отчество студента: #{@id}")
    end
  end

  def phone_number=(phone_number)
    if phone_number.nil? or phone_number.empty?
      @phone_number = nil
    elsif Student.is_phone_number_valid? (phone_number)
      @phone_number = phone_number.gsub(' ', '')
    else
      raise ArgumentError.new("Неверный номер телефона студента: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end
  end

  def email=(email)
    if email.nil? or email.empty?
      @email = nil
    elsif Student.is_email_valid? (email)
      @email = email
    else
      raise ArgumentError.new("Неверный адрес электронной почты: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end
  end

  def telegram=(telegram)
    if telegram.nil? or telegram.empty?
      @telegram = nil
    elsif Student.is_telegram_valid? (telegram)
      @telegram = telegram
    else
      raise ArgumentError.new("Неверный telegram: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end
  end

  def birthdate=(birthdate)
    @birthdate = Date.parse(birthdate.to_s).to_date
  end

  private :surname, :firstname, :lastname, :birthdate=, :phone_number=, :email=, :telegram=

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
          when 'birthdate'
            student_init[:birthdate] = value
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

  def set_contacts(hash_contacts)
    self.phone_number = hash_contacts[:phone_number]
    self.email = hash_contacts[:email]
    self.telegram = hash_contacts[:telegram]

    self.contact = contacts
  end

  def get_name
    "#{@surname} #{@firstname[0].upcase}.#{@lastname[0].upcase}."
  end

  def getInfo
    "#{self.get_name} #{self.get_git_and_contact}"
  end

  def to_s
    "#{@id} #{@surname} #{@firstname} #{@lastname}\nДата рождения: #{@birthdate}\nGit: #{@git}\nДанные для связи:\n  Номер телефона: #{@phone_number}\n  Телеграм: #{@telegram}\n  Email: #{@email}\n\n"
  end
  
  def to_file
    "id: #{@id}; surname: #{@surname}; firstname: #{@firstname}; lastname: #{@lastname}; birthdate: #{@birthdate}; phone_number: #{@phone_number}; telegram: #{@telegram}; email: #{@email}; git: #{@git}"
  end

  def to_hash
    {
      id: @id,
      surname: @surname,
      firstname: @firstname,
      lastname: @lastname,
      birthdate: @birthdate,
      phone_number: @phone_number,
      telegram: @telegram,
      email: @email,
      git: @git
    }
  end

end
