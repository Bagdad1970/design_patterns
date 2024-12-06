require 'fox16'
include Fox


class StudentsWindow < FXMainWindow

  def initialize(app)
    super(app, "Students", width: 1100, height: 750)

    tab_placement = FXTabBook.new(self, opts: LAYOUT_FILL)

    tab_student_list_view = FXTabItem.new(tab_placement, 'Student List View')
    tab_student_list_view_frame = FXVerticalFrame.new(tab_placement, opts: FRAME_THICK | LAYOUT_FILL)

    tab_3 = FXTabItem.new(tab_placement, 'Tab2')
    tab_2_frame = FXVerticalFrame.new(tab_placement, opts: FRAME_THICK | LAYOUT_FILL)

    tab_3 = FXTabItem.new(tab_placement, 'Tab3')
    tab_3_frame = FXVerticalFrame.new(tab_placement, opts: FRAME_THICK | LAYOUT_FILL)

  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

end

if __FILE__ == $0

  FXApp.new do |app|
    StudentsWindow.new(app)
    app.create
    app.run
  end

end
