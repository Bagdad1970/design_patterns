require 'fox16'
include Fox

class StudentTableFrame < FXHorizontalFrame
  def initialize(parent, width:, height:, opts: FRAME_SUNKEN | LAYOUT_FILL)
    super(parent, opts: opts, width: width, height: height)

    @table = FXTable.new(self, opts: LAYOUT_FILL)
    setup_table
  end

  def setup_table
    @table.setTableSize(5, 3)
  end
end

