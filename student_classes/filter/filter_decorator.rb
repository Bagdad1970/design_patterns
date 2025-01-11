require_relative 'ifilter.rb'

class FilterDecorator < IFilter

  def initialize(wrappee)
    @wrappee = wrappee
  end

  def apply(students)
    @wrappee.apply(students)
  end

  def filter_names
    if @wrappee.respond_to?(:filter_names)
      @wrappee.filter_names << self.class.name
    else
      return [self.class.name]
    end
  end

end
