require_relative 'filter_decorator.rb'

class HasGitFilter < FilterDecorator

  def initialize(wrappee)
    super(wrappee)
  end

  def apply(students)
    if students.is_a?(Array)
      return students.select {|student| student.has_git? == true}
    end
  end

end
