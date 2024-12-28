require_relative 'filter_decorator.rb'

class HasGitFilter < FilterDecorator

  def initialize(wrappee)
    super(wrappee)
  end

  def apply(students)
    filtered_students = @wrappee.apply(students)
    return filtered_students.select {|student| student.has_git? == true}
  end

end
