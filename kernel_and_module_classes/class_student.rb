class Student
 
  attr_accessor :id, :telegram
  attr_reader :surname, :firstname, :lastname, :telegram, :email, :git, :phone_number

  def initialize(surname:, firstname:, lastname:, id: nil, phone_number: nil, telegram: nil, email: nil, git: nil)
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
      raise ArgumentError.new("Неверная фамилия студента: #{@id}")
    end

  end

  def firstname=(firstname)
    if Student.is_name_valid? (surname)
      @firstname = firstname
    else
      raise ArgumentError.new("Неверное имя студента: #{@id} #{@surname}")
    end

  end

  def lastname=(lastname)
    if lastname.empty? or Student.is_name_valid? (lastname)
      @lastname = lastname
    else
      raise ArgumentError.new("Неверное отчество студента: #{@id} #{@surname} #{@firstname}")
    end

  end

  def phone_number=(phone_number)
    if phone_number.nil? or Student.is_phone_number_valid? (phone_number)
      @phone_number = phone_number
    else
      raise ArgumentError.new("Неверный номер телефона для студента: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end

  end

  def email=(email)
    if email.nil? or Student.is_email_valid? (email)
      @email = email 
    else
      raise ArgumentError.new("Неверный адрес электронной почты: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end
  end

  def git=(git)
    if git.nil? or Student.is_git_valid? (git)
      @git = git
    else
      raise ArgumentError.new("Неверный git: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end
  end

  private :surname=, :firstname=, :lastname=, :phone_number=, :email=, :git=

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


  def Student.is_phone_number_valid? (checked_phone_number)
    phone_number_reg = /^\+?\d{1,3}\s?\(?\s*\d{3}\s*\)?\s?\d{3}\-{0,1}\d{2}\-{0,1}\d{2}\s*$/
  
    return checked_phone_number =~ phone_number_reg

  end

  def Student.is_email_valid? (checked_email)
    email_reg = /^[A-Za-z0-9._-]+\@[A-Za-z0-9._-]{0,5}mail\.[A-Za-z0-9._-]+/

    return checked_email =~ email_reg

  end

  def Student.is_name_valid? (checked_name)
    name_reg = /^[A-Za-zА-яа-я]+$/

    return checked_name =~ name_reg

  end

  def Student.is_git_valid? (checked_git)
    git_reg = /^github\.com\/[A-Za-z0-9._-]+\/?$/

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

  def set_contacts(hash_contacts)
    if !(hash_contacts[:phone_number].nil?)
      @phone_number = hash_contacts[:phone_number]
    end

    if !(hash_contacts[:email].nil?)
      @phone_number = hash_contacts[:email]
    end

    if !(hash_contacts[:telegram].nil?)
      @phone_number = hash_contacts[:telegram]
    end

  end


  def get_contact
    contact_info = nil

    if !@phone_number.nil?
      contact_info = @phone_number
    elsif !@email.nil?
      contact_info = @email
    elsif !@telegram.nil?
      contact_info = @telegram
    end

    return contact_info

  end

  def get_name
    "#{@surname} #{@firstname[0].upcase}.#{@lastname[0].upcase}." 
  end

  def get_git_and_contact
    "#{@git} #{self.get_contact}"
  end

  def getInfo
    "#{self.get_name} #{self.get_git_and_contact}"

  end

  def to_s
    "#{@id} #{@surname} #{@firstname} #{@lastname}\nДанные для связи:\nНомер телефона: #{@phone_number}\nТелеграм: #{@telegram}\nEmail: #{@email}\nGit: #{git}\n\n"
  end

  
  def to_str
    "id: #{@id}; surname: #{@surname}; firstname: #{@firstname}; lastname: #{@lastname}; phone_number: #{@phone_number}; telegram: #{@telegram}; email: #{@email}; git: #{git}"
  end

end


class Student_Short < Student

  attr_reader :name, :id, :git, :contact

  private :set_contacts

  def initialize(*args)
    if args.length == 1  # initialize for type Student parametr
      student_obj = args[0]

      super(surname: student_obj.surname, firstname: student_obj.firstname, lastname: student_obj.lastname,
            id: student_obj.id, phone_number: student_obj.phone_number,
            telegram: student_obj.telegram, email: student_obj.email, git: student_obj.git
           )

      @id = student_obj.id
      @name = "#{student_obj.surname} #{student_obj.firstname[0].upcase}.#{student_obj.lastname[0].upcase}."
      @git = student_obj.git
      @contact = student_obj.get_contact

    elsif args.length == 2  # initialize for id and String parametrs
      id = args[0].to_i
      student_string = args[1]

      student_params = Student.params_from_string(student_string)

      super(surname: student_params[:surname], firstname: student_params[:firstname], lastname: student_params[:lastname], id: id, phone_number: student_params[:phone_number], telegram: student_params[:telegram], email: student_params[:email], git: student_params[:git])

      @name = "#{@surname} #{@firstname[0].upcase}.#{@lastname[0].upcase}."  
      @contact = get_contact
      
    end

  end

  def to_s
    "#{@id} #{@name} #{@git} #{@contact}"
  end

end

