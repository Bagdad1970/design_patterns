class IFilter
  
  def apply(students)
    raise NotImplementedError.new("#{self.class} not implemented method #{__method__}")
  end

end
