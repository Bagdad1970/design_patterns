require_relative 'app/handler_frame.rb'
require_relative 'app/student_table_frame.rb'

require 'fox16'
include Fox

class MainWindow < FXMainWindow
  def initialize(app)
    super(app, "Students", width: 1100, height: 750)

    tab_placement = FXTabBook.new(self, opts: LAYOUT_FILL)

    tab_student_list_view = FXTabItem.new(tab_placement, 'Student List View')
    tab_student_list_view_frame = FXHorizontalFrame.new(tab_placement, opts: FRAME_THICK | LAYOUT_FILL)
    setup_student_list_view_areas(tab_student_list_view_frame)

    tab_2 = FXTabItem.new(tab_placement, 'Tab2')
    tab_2_frame = FXVerticalFrame.new(tab_placement, opts: FRAME_THICK | LAYOUT_FILL)

    tab_3 = FXTabItem.new(tab_placement, 'Tab3')
    tab_3_frame = FXVerticalFrame.new(tab_placement, opts: FRAME_THICK | LAYOUT_FILL)
  end

  def setup_student_list_view_areas(parent)
    # Фильтрация
    filter_area = FXHorizontalFrame.new(parent, opts: FRAME_SUNKEN | LAYOUT_FILL_X | LAYOUT_FIX_WIDTH | LAYOUT_FIX_HEIGHT, width: self.width * 0.10, height: self.height)

    # Таблица
    table_area = StudentTableFrame.new(parent, width: (self.width * 0.85).to_i, height: self.height)

    # Область управления
    handler_area = HandlerFrame.new(parent, width: (self.width * 0.2).to_i, height: self.height)
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

if __FILE__ == $0
  FXApp.new do |app|
    MainWindow.new(app)
    app.create
    app.run
  end
end

