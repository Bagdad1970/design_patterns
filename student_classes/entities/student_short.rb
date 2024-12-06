require_relative 'person.rb'

class Student_Short < Person
  
  def initialize(id:, name:, git:, contact:)
    initials = name.split[1].split('.').map(&:capitalize)
    surname, firstname, lastname = name.split[0], initials[0], initials[1]

    if id.nil?
      raise ArgumentError.new("Отсутствует id студента: #{surname} #{firstname}.#{lastname}.")
    end

    super(surname: surname, firstname: firstname, lastname: lastname, id: id, git: git, contact: contact)
  end

  private_class_method :new

  def Student_Short.create_from_string(id:, data:)
    student_short_init = {}

    params = Student_Short.parse_string_params(data)

    student_short_init[:id] = id
    student_short_init[:name] = params[0..1].join(' ')
    student_short_init[:git] = params[2]
    student_short_init[:contact] = params[3..].join('')
    self.new(**student_short_init)
  end

  def Student_Short.create_from_student(student_obj)
    student_short_init = {}

    student_short_init[:id] = student_obj.id
    student_short_init[:name] = student_obj.get_name
    student_short_init[:git] = student_obj.git
    student_short_init[:contact] = student_obj.contact

    self.new(**student_short_init)
  end

  def Student_Short.create_from_hash(student_hash)
    student_short_init = {}

    student_short_init[:id] = student_hash[:id]
    student_short_init[:name] = student_hash[:surname] + ' ' + student_hash[:firstname][0].upcase + '.' + student_hash[:lastname][0].upcase + '.'
    student_short_init[:git] = student_hash[:git]
    student_short_init[:contact] = (student_hash[:phone_number].to_s + ' ' + student_hash[:telegram].to_s + ' ' + student_hash[:email].to_s).split[0]

    self.new(**student_short_init)
  end

  def Student_Short.parse_string_params(str_params)
    return str_params.split
  end

  def to_s
    "#{@id} #{self.get_name} #{@git} #{@contact}"
  end

end

