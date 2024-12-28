require_relative 'filter_decorator.rb'

class HasContactFilter < FilterDecorator

  def initialize(wrappee)
    super(wrappee)
  end

  def apply(students)
    filtered_students = @wrappee.apply(students)
    return filtered_students.select {|student| student.has_contact? == true}
  end

end
