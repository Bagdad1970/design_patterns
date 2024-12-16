require_relative 'ifilter.rb'

class FilterDecorator < IFilter

  def initialize(wrappee)
    @wrappee = wrappee
  end

  def apply(students)
    @wrappee.apply(students)
  end

end
