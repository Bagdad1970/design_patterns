class StudentListController

  attr_accessor :view, :student_list, :current_data_list, :current_page, :max_page, :amount_rows
  private :view=, :student_list=, :current_page=, :max_page=

  def initialize(student_list, view)
    self.student_list = student_list
    self.view = view
    self.amount_rows = 20
    self.current_page = 1
    self.max_page = update_max_page 
    self.current_data_list = Data_List_Student_Short.new
  end

  def decrease_page_num
    self.current_page -= 1
  end
  
  def increase_page_num
    self.current_page += 1
  end

  def set_amount_rows_on_page(amount_rows)
    if amount_rows != self.amount_rows
      self.amount_rows = amount_rows
      update_max_page
    end
  end

  def update_max_page
    self.max_page = (self.student_list.get_student_count.to_f / self.amount_rows).ceil
  end

  def refresh_data
    begin
      self.student_list.get_k_n_student_short_list(page: self.current_page, amount_rows: self.amount_rows, data_list: self.current_data_list)
      self.current_data_list.set_view(self.view)
      self.current_data_list.notify
    rescue Mysql2::Error::ConnectionError
      raise DataBaseDisconnectedError.new
    rescue Mysql2::Error
      raise DataBaseClientNotConnectedError.new
    end
  end

  def show_exception(exception)
    self.view.show_exception_dialog(exception)
  end

  private :show_exception

end
