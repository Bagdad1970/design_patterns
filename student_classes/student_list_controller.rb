require_relative 'exceptions.rb'

class StudentListController

  attr_accessor :view, :student_list, :current_data_list
  private :view=, :student_list=

  def initialize(student_list, view)
    self.student_list = student_list
    self.view = view
    self.current_data_list = nil
  end

  def get_max_page_num
    return (self.student_list.get_student_count.to_f / self.view.table.numRows).ceil
  end

  def refresh_data(page)
    begin
      amount_rows = self.view.table.numRows.zero? ? 20 : self.view.table.numRows
      self.current_data_list = self.student_list.get_k_n_student_short_list(page: page, amount_rows: amount_rows)
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

end
