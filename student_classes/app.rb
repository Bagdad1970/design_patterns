require_relative 'student_list_view.rb'
require_relative 'student_list_controller.rb'
require_relative 'student_list/student_list_db.rb'
require_relative 'student_list/student_list.rb'
require_relative 'entities/student_short.rb'
require_relative 'output_classes/data_list_student_short.rb'
require_relative 'exceptions.rb'

require 'fox16'
include Fox

class MainWindow < FXMainWindow
  def initialize(app)
    super(app, "Students", width: 1300, height: 750)

    @tab_placement = FXTabBook.new(self, opts: LAYOUT_FILL)
    setup_tab_student_list
    setup_tab_2
    setup_tab_3
  end

  def setup_tab_student_list
    @tab_student_list = FXTabItem.new(@tab_placement, 'Student List View')
    @student_list_view = StudentListView.new(@tab_placement, width: self.width, height: self.height, opts: FRAME_THICK | LAYOUT_FILL)
  end

  def setup_tab_2
    @tab_2 = FXTabItem.new(@tab_placement, 'Tab2')
    @tab_2_frame = FXVerticalFrame.new(@tab_placement, opts: FRAME_THICK | LAYOUT_FILL)
  end

  def setup_tab_3
    @tab_3 = FXTabItem.new(@tab_placement, 'Tab3')
    @tab_3_frame = FXVerticalFrame.new(@tab_placement, opts: FRAME_THICK | LAYOUT_FILL)
  end

  def configure_tab_student_list
    begin
      student_list_db = Student_List_DB.new(host: 'localhost', username: 'bagdad', password: '123', database: 'mysql')
      student_list = Student_List.new(student_list_db)
      student_list_controller = StudentListController.new(student_list, @student_list_view)
      @student_list_view.set_controller(student_list_controller)
      @student_list_view.refresh_data
    rescue DataBaseConnectionError => error
      show_exception_dialog(error)
    end
  end

  def show_exception_dialog(exception)
    FXMessageBox.error(self, MBOX_OK, "Ошибка #{exception.class}", exception.message)
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

if __FILE__ == $0
  FXApp.new do |app|
    main_window = MainWindow.new(app)
    app.create

    app.addTimeout(100) {main_window.configure_tab_student_list}
    app.run
  end
end

