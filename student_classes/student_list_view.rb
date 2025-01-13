require 'fox16'
include Fox

class StudentListView < FXHorizontalFrame

  attr_accessor :selected_row, :data, :table, :selected_rows, :controller, :max_page, :current_page
  
  private :controller=

  def initialize(parent, width:, height:, opts:)
    super(parent, width: width, height: height, opts: opts)
    self.controller = nil
    self.current_page = 1
    self.max_page = 1

    setup_filter_area
    setup_table_area
    setup_handle_area
  end

  def set_controller(controller)
    self.controller = controller
  end

  def setup_filter_area
    @filter_area = FXVerticalFrame.new(self, width: (self.width * 0.20).to_i, height: self.height, opts: FRAME_SUNKEN)
    @name_filter = add_name_field
    @git_filter = add_filter_part("Git")
    @email_filter = add_filter_part("Электронная почта")
    @phone_number_filter = add_filter_part("Телефон")
    @telegram_filter = add_filter_part("Telegram")
  end

  def setup_table_area
    @table_area = FXVerticalFrame.new(self, width: (self.width * 0.80).to_i, height: self.height, opts: FRAME_SUNKEN | LAYOUT_FILL)

    setup_table
    setup_page_buttons
  end

  def set_table_params(column_names, entities_count)
    column_headers = [{name: "№", width: 30}, {name: "Фамилия и инициалы", width: 200}, {name: "Гит", width: 250}, {name: "Контакты", width: 250}]

    self.table.setTableSize(entities_count, column_names.size)
    column_names.each_with_index do |name, index|
      self.table.setColumnText(index, name)
    end
  end

  def set_table_data(data_table)
    p self.table.numColumns
    p self.table.numRows
    (0...data_table.row_count).each do |row_index|
      data_table[row_index].each_with_index do |item, column_index|
          self.table.setItemText(row_index, column_index, item.to_s)
      end
    end

    (data_table.row_count...self.table.numRows).each do |row_index|
      (0...self.table.numColumns).each do |column_index|
        self.table.setItemText(row_index, column_index, "")
      end
    end
  end

  def setup_table
    self.table = FXTable.new(@table_area, opts: LAYOUT_FILL | TABLE_READONLY)
    self.table.rowHeaderWidth = 40
    self.selected_rows = []

    self.table.connect(SEL_SELECTED) do
      self.selected_rows = (0...self.table.numRows).select {|i| self.table.rowSelected?(i)}
      if self.selected_rows.size > 1
        @delete_button.enable
      elsif self.selected_rows.size == 1
        @edit_button.enable
        @delete_button.enable
      else
        @delete_button.disable
        @edit_button.disable
      end
    end
  end

  def refresh_data
    self.controller.refresh_data(self.current_page)
    self.max_page = self.controller.get_max_page_num
  end

  def setup_page_buttons
    paging_frame = FXHorizontalFrame.new(@table_area, opts: LAYOUT_FILL_X | LAYOUT_LEFT)

    @prev_button = FXButton.new(paging_frame, "Предыдущая", opts: FRAME_RAISED)
    @page_info_label = FXLabel.new(paging_frame, "#{self.current_page} / #{self.max_page}", opts: LAYOUT_CENTER_X | LAYOUT_CENTER_Y)
    @next_button = FXButton.new(paging_frame, "Следующая", opts: FRAME_RAISED)

    @prev_button.connect(SEL_COMMAND) do
      if self.current_page > 1
        self.current_page -= 1
        refresh_data
        update_page_num
      end
    end

    @next_button.connect(SEL_COMMAND) do
      if self.current_page < self.max_page
        self.current_page += 1
        refresh_data
        update_page_num
      end
    end
  end

  def update_page_num
    @page_info_label.text = "Страница #{self.current_page} / #{self.max_page}"
  end

  def setup_handle_area
    handle_area = FXVerticalFrame.new(self, width: (self.width * 0.15).to_i, height: self.height, opts: FRAME_SUNKEN | LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH)

    handle_label = FXLabel.new(handle_area, "Управление")
    @add_button = FXButton.new(handle_area, 'Добавить', opts: FRAME_RAISED | LAYOUT_FILL_X)
    @update_button = FXButton.new(handle_area, 'Обновить студента', opts: FRAME_RAISED | LAYOUT_FILL_X)
    @edit_button = FXButton.new(handle_area, 'Изменить студента', opts: FRAME_RAISED | LAYOUT_FILL_X)
    @edit_button.disable
    @delete_button = FXButton.new(handle_area, 'Удалить студента', opts: FRAME_RAISED | LAYOUT_FILL_X)
    @delete_button.disable
  end

  def add_name_field
    part_frame = FXVerticalFrame.new(@filter_area, opts: LAYOUT_FILL_X | PACK_UNIFORM_WIDTH)

    FXLabel.new(part_frame, "Фамилия и инициалы", opts: LAYOUT_LEFT)
    FXTextField.new(part_frame, 30, opts: TEXTFIELD_NORMAL | LAYOUT_FILL_X | LAYOUT_CENTER_X)
  end

  def add_filter_part(label_text)
    part_frame = FXVerticalFrame.new(@filter_area, opts: LAYOUT_FILL_X | PACK_UNIFORM_WIDTH)

    FXLabel.new(part_frame, label_text, opts: LAYOUT_LEFT)

    create_combo_with_text(part_frame)
  end

  def create_combo_with_text(part_frame)
    horizontal_frame = FXHorizontalFrame.new(part_frame, opts: LAYOUT_FILL_X | LAYOUT_CENTER_X)

    combo_box = FXComboBox.new(horizontal_frame, 10, opts: COMBOBOX_NORMAL | FRAME_SUNKEN | FRAME_THICK | LAYOUT_FILL_X)
    combo_box.appendItem("Не важно")
    combo_box.appendItem("Да")
    combo_box.appendItem("Нет")
    combo_box.numVisible = 3
    combo_box.setCurrentItem(0)

    text_field = FXTextField.new(horizontal_frame, 20, opts: TEXTFIELD_NORMAL | LAYOUT_FILL_X)
    text_field.enabled = false

    combo_box.connect(SEL_COMMAND) do
      if combo_box.currentItem == 1
        text_field.enabled = true
      else
        text_field.enabled = false
      end
    end
  end

end
