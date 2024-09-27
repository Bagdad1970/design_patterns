class Student_short

  attr_reader :id, :name, :git, :contact
  
  def initialize(*args)
    if args.length == 1
      student_info = args[0].getInfo.split

      @id = args[0].id
      @name = student_info[0] + " " + student_info[1]
      @git = student_info[2]
      @contact = student_info[4..-1].join('')

    elsif args.length == 2
      @id = args[0]

      params = Student_short.parse_string_params(args[1])
      @name = params[0] + ' ' + params[1]
      @git = params[2]
      @contact = params[3]
      
    end

  end

  def self.parse_string_params(str_params)
    return str_params.split
  end

  def to_s
    "#{@id} #{@name} #{@git} #{@contact}"
  end

end
