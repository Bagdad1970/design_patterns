class StudentListController

  attr_accessor :view, :student_list
  private :view=, :student_list=

  def initialize(student_list, view)
    self.student_list = student_list
    self.view = view
    #self.subscribe(self)
  end

  def get_max_page_num
    return (self.student_list.get_student_count.to_f / self.view.table.numRows).ceil
  end

  def refresh_data
    data_list = self.student_list.get_k_n_student_short_list(amount_rows: self.view.table.numRows)
    data_table = data_list.get_data_table

    self.view.table.clearItems
    (0...data_table.row_count).each do |row_index|
      data_table[row_index].each_with_index do |item, column_index|
          self.view.table.setItemText(row_index, column_index, item.to_s)
      end
    end
  end

=begin
  def next_page_notice(amount_rows)
    self.student_list.current_page += 1
    new_data = self.student_list.get_k_n_student_short_list(amount_rows: amount_rows)
    fill_table(new_data)
  end

  def prev_page_notice(amount_rows)
    self.student_list.current_page -= 1
    new_data = self.student_list.get_k_n_student_short_list(page: page, amount_rows: amount_rows)
    fill_table(new_data)
  end
=end

end
