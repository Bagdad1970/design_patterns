require 'fox16'
include Fox

class StudentListView < FXHorizontalFrame

  attr_accessor :selected_row, :current_page, :max_page, :data, :table, :selected_rows

  def initialize(parent, width:, height:)
    super(parent, width: width, height: height, opts: FRAME_THICK | LAYOUT_FILL)

    self.data = [
      ["1", "Саенко И.О.", "github.com/ivan", "+7(905)468-78-98"],
      ["2", "Иванов А.А.", "github.com/andrey", "andrey@mail.com"],
      ["3", "Петров В.В.", "github.com/viktor", "@viktor_petrov"],
      ["4", "Сидорова М.П.", "github.com/maria", "+7(925)345-67-89"],
      ["5", "Кузнецов О.Д.", "github.com/oleg", "oleg.kuznetsov@mail.com"],
      ["6", "Морозова А.В.", "github.com/anna", "@anna_morozova"],
      ["7", "Васильев Н.Г.", "github.com/nikolay", "+7(960)456-78-90"],
      ["8", "Попов Д.С.", "github.com/dmitry", "d.popov@mail.com"],
      ["9", "Егоров П.И.", "github.com/pavel", "@pavel_egorov"],
      ["10", "Коваленко Т.Л.", "github.com/tatyana", "+7(903)567-89-01"],
      ["11", "Крылов А.Е.", "github.com/alexey", "alexey.krylov@mail.com"],
      ["12", "Федорова Ю.П.", "github.com/yulia", "@yulia_fedorova"],
      ["13", "Новиков С.А.", "github.com/sergey", "+7(906)123-45-67"],
      ["14", "Максимова Л.Н.", "github.com/lidia", "lidia.maksimova@mail.com"],
      ["15", "Орлов О.М.", "github.com/oleg_orlov", "@oleg_orlov"],
      ["16", "Григорьев П.В.", "github.com/pavel_g", "+7(929)456-78-90"],
      ["17", "Дмитриев А.С.", "github.com/andrey_d", "andrey.dmitriev@mail.com"],
      ["18", "Романов И.Ю.", "github.com/ivan_r", "@ivan_romanov"],
      ["19", "Зайцева Н.К.", "github.com/natalia", "+7(923)234-56-78"],
      ["20", "Смирнова А.А.", "github.com/alena", "alena.smirnova@mail.com"],
    ]

    self.current_page = 1
    self.max_page = 1


    setup_filter_area
    setup_table_area
    setup_handle_area
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

  def setup_column_headers
    column_headers = [{name: "№", width: 30}, {name: "Фамилия и инициалы", width: 200}, {name: "Гит", width: 200}, {name: "Контакты", width: 250}]

    self.table.setTableSize(20, column_headers.size)
    column_headers.each_with_index do |features, index|
      self.table.setColumnText(index, features[:name])
      self.table.setColumnWidth(index, features[:width])
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
        @edit_button.enable
      elsif self.selected_rows.size == 1
        @delete_button.enable
      else
        @delete_button.disable
        @edit_button.disable
      end
    end

    setup_column_headers
    fill_table(1)
  end

  def fill_table(num_page)
    left_row_num = self.table.getNumRows * (self.current_page-1)
    right_row_num = left_row_num + self.table.getNumRows
    paged_data = self.data[left_row_num...right_row_num]

    paged_data.each_with_index do |row_data, row_index|
      
      row_data.each_with_index do |item, column_index|
        if item.nil? or item == ""
          self.table.setItemText(row_index, column_index, "")
        else
          self.table.setItemText(row_index, column_index, self.data[row_index][column_index])
        end
      end
    end
  end

  def setup_page_buttons
    paging_frame = FXHorizontalFrame.new(@table_area, opts: LAYOUT_FILL_X | LAYOUT_LEFT) 

    @prev_button = FXButton.new(paging_frame, "Предыдущая", opts: FRAME_RAISED)
    @page_info_label = FXLabel.new(paging_frame, "#{self.current_page} / #{self.max_page}", opts: LAYOUT_CENTER_X | LAYOUT_CENTER_Y)
    @next_button = FXButton.new(paging_frame, "Следующая", opts: FRAME_RAISED)

    @prev_button.connect(SEL_COMMAND) do
      if @current_page > 1
        table.current_page -= 1
        fill_table(self.table.current_page)
        update_page_info
      end
    end

    @next_button.connect(SEL_COMMAND) do
      if @current_page < self.max_page
        table.current_page += 1
        fill_table(self.table.current_page)
        update_page_info
      end
    end
  end

  def update_page_info
    @page_info_label.text = "Page #{self.table.current_page} / #{table.max_page}"
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
    part_frame = FXVerticalFrame.new(@filter_area, opts: LAYOUT_FILL_X | PACK_UNIFORM_WIDTH )

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
    text_field.enabled = false # По умолчанию отключено

    combo_box.connect(SEL_COMMAND) do
      case combo_box.currentItem
        when 1
          text_field.enabled = true
        else
          text_field.enabled = false
      end
    end
  end

end
