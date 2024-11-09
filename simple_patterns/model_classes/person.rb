class Person

  attr_accessor :id
  attr_reader :surname, :firstname, :lastname, :git, :contact

  def initialize(surname:, firstname:, lastname:, id: nil, git: nil, contact: nil)
    self.surname = surname
    self.firstname = firstname
    self.lastname = lastname
    self.id = id.to_i
    self.git = git
    self.contact = contact
  end

  def surname=(surname)
    if !(surname.nil?) and Person.is_name_valid? (surname)
      @surname = surname
    else
      raise ArgumentError.new("Неверная фамилия студента: #{@id}")
    end
  end

  def firstname=(firstname)
    if !(firstname.nil?) and Person.is_name_valid? (firstname)
      @firstname = firstname
    else
      raise ArgumentError.new("Неверное имя студента: #{@id}")
    end
  end

  def lastname=(lastname)
    if !(lastname.nil?) and Person.is_name_valid? (lastname)
      @lastname = lastname
    else
      raise ArgumentError.new("Неверное отчество студента: #{@id}")
    end
  end

  def git=(git)
    if git.nil? or Person.is_git_valid? (git)
      @git = git
    else
      raise ArgumentError.new("Неверный git: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end
  end

  def contact=(contacts_string)
    contact = contacts_string.to_s.split[0]
    if contact.nil? or Person.is_phone_number_valid? (contact) or Person.is_email_valid? (contact) or Person.is_telegram_valid? (contact)
      @contact = contact
    else
      raise ArgumentError.new("Неверный контакт человека: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end

  end

  private :surname=, :firstname=, :lastname=, :id=, :git=
  protected :contact=

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
    telegram_reg = /^@[A-Za-z0-9_]{4,20}$/

    return checked_telegram =~ telegram_reg
  end

  def has_git?
    return !(self.git.nil?)
  end

  def has_contact?
    return !(self.contact.nil?)
  end

  def get_name
    "#{@surname} #{@firstname[0].upcase}.#{@lastname[0].upcase}."
  end

  def get_git_and_contact
    "Git: #{@git} #{self.contact}"
  end

  def getInfo
    "#{self.get_name} #{self.get_git_and_contact}"
  end

  public :has_git?, :has_contact?, :get_name, :get_git_and_contact, :getInfo

end
