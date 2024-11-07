require_relative 'person.rb'

class Student_Short < Person

  @@count_objects = 0
  
  def initialize(name:, git:, contact:)
    initials = name.split[1].split('.').map(&:capitalize)
    surname, firstname, lastname = name.split[0], initials[0], initials[1]

    @@count_objects += 1

    super(surname: surname, firstname: firstname, lastname: lastname, id: @@count_objects, git: git, contact: contact)

  end

  def <=>(other)
    self.id <=> other.id
  end

  def to_s
    "#{@id} #{self.get_name} #{@git} #{@contact}"
  end

end
