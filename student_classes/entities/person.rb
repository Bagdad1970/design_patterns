class Person

  attr_accessor :id
  attr_reader :git, :contact

  def initialize(id: nil, git: nil, contact: nil)
    self.id = id.to_i
    self.git = git
    self.contact = contact
  end

  def <=>(other)
    self.id <=> other.id
  end

  def git=(git)
    if git.nil? or Person.is_git_valid? (git)
      @git = git
    else
      raise ArgumentError.new("Неверный git: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end
  end

  def contact=(contacts)
    contact = contacts.find {|contact| !(contact.nil?)} if contacts.is_a? (Array)
    contact = contacts if contacts.is_a? (String)

    if contact.nil? or Person.is_phone_number_valid? (contact) or Person.is_email_valid? (contact) or Person.is_telegram_valid? (contact)
      @contact = contact
    else
      raise ArgumentError.new("Неверный контакт: #{@id} #{@surname} #{@firstname} #{@lastname}")
    end
  end

  private :id=, :git=
  protected :contact=

  def Person.is_name_valid? (checked_name)
    name_reg = /^[A-Za-zА-Яа-яёЁ]+$/
    return checked_name =~ name_reg
  end
  
  def Person.is_initials_valid? (checked_initials)
    initials_reg = /^[A-Za-zА-Яа-яёЁ]\.[A-Za-zА-Яа-яёЁ]\.$/
    return checked_initials =~ initials_reg
  end

  def Person.is_phone_number_valid? (checked_phone_number)
    phone_number_reg = /^\+?\d{1,3}\s?\(?\s*\d{3}\s*\)?\s?\d{3}\-{0,1}\d{2}\-{0,1}\d{2}\s*$/
    return checked_phone_number =~ phone_number_reg
  end

  def Person.is_email_valid? (checked_email)
    email_reg = /^[A-Za-z0-9._-]+\@[A-Za-z0-9._-]{0,5}mail\.[A-Za-z0-9._-]+/
    return checked_email =~ email_reg
  end

  def Person.is_git_valid? (checked_git)
    git_reg = /^github\.com\/[A-Za-z0-9._-]+\/?$/
    return checked_git =~ git_reg
  end

  def Person.is_telegram_valid? (checked_telegram)
    telegram_reg = /^@[A-Za-z0-9_]{4,32}$/
    return checked_telegram =~ telegram_reg
  end

  def has_git?
    return !(self.git.nil?)
  end

  def has_contact?
    return !(self.contact.nil?)
  end

  def get_contact
    if Person.is_phone_number_valid? (self.contact)
      return "Номер телефона: #{self.contact}"
    elsif Person.is_email_valid? (self.contact)
      return "Электронная почта: #{self.contact}"
    elsif Person.is_telegram_valid? (self.contact)
      return "Телеграм: #{self.contact}"
    end
  end

  def get_git_and_contact
    "Git: #{@git} #{get_contact}"
  end

  public :has_git?, :has_contact?, :get_git_and_contact

end
