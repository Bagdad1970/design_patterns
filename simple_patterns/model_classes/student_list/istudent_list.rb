class IStudent_List

  def get_student_by_id(required_id)
    raise NotImplementedError.new("#{self.class} not implemented method #{__method__}")
  end

  def get_k_n_student_short_list(page:, amount_rows: 20, data_list: nil)
    raise NotImplementedError.new("#{self.class} not implemented method #{__method__}")
  end

  def add_student(student)
    raise NotImplementedError.new("#{self.class} not implemented method #{__method__}")
  end

  def replace_student_by_id(required_id, new_student)
    raise NotImplementedError.new("#{self.class} not implemented method #{__method__}")
  end

  def delete_student_by_id(required_id)
    raise NotImplementedError.new("#{self.class} not implemented method #{__method__}")
  end

  def get_student_count
    raise NotImplementedError.new("#{self.class} not implemented method #{__method__}")
  end

end
