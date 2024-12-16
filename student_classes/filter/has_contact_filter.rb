require_relative 'filter_decorator.rb'

class HasContactFilter < FilterDecorator

  def initialize(wrappee)
    super(wrappee)
  end

  def apply(students)
    if students.is_a?(Array)
      return students.select {|student| student.has_contact? == true}
    end
  end

end
