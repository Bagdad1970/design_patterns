class Student_Short

  attr_reader :id, :name, :git, :contact
  attr_accessor :id, :name, :git, :contact
  
  def initialize(id:, name:, git:, contact:)
    self.id = id
    self.name = name
    self.git = git
    self.contact = contact
  end

  def Student_Short.create_from_string(id, data)
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

    student_short_init[:id] = student_obj.id
    student_short_init[:name] = student_obj.get_name
    student_short_init[:git] = student_obj.git
    student_short_init[:contact] = student_obj.get_contact

    self.new(**student_short_init)

  end

  def self.parse_string_params(str_params)
    return str_params.split
  end

  def to_s
    "#{@id} #{@name} #{@git} #{@contact}"
  end

end

