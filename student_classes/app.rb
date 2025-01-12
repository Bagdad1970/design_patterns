require_relative 'student_list_view.rb'
require_relative 'student_list_controller.rb'
require_relative 'student_list/student_list_db.rb'
require_relative 'student_list/student_list.rb'
require_relative 'entities/student_short.rb'
require_relative 'output_classes/data_list_student_short.rb'

require 'fox16'
include Fox

class MainWindow < FXMainWindow
  def initialize(app)
    super(app, "Students", width: 1300, height: 750)

    tab_placement = FXTabBook.new(self, opts: LAYOUT_FILL)

    tab_student_list_view = FXTabItem.new(tab_placement, 'Student List View')
    setup_student_list_view(tab_placement)
    
    tab_2 = FXTabItem.new(tab_placement, 'Tab2')
    tab_2_frame = FXVerticalFrame.new(tab_placement, opts: FRAME_THICK | LAYOUT_FILL)

    tab_3 = FXTabItem.new(tab_placement, 'Tab3')
    tab_3_frame = FXVerticalFrame.new(tab_placement, opts: FRAME_THICK | LAYOUT_FILL)
  end

  def setup_student_list_view(concrete_tab)
    student_list_db = Student_List_DB.new(host: 'localhost', username: 'bagdad', password: '123', database: 'mysql')
    student_list = Student_List.new(student_list_db)
    student_list_view = StudentListView.new(concrete_tab, width: 1300, height: 750, opts: FRAME_THICK | LAYOUT_FILL)
    student_list_controller = StudentListController.new(student_list, student_list_view)
    student_list_view.set_controller(student_list_controller)
    student_list_view.refresh_data
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

