class StudentTableFrame < FXHorizontalFrame
  def initialize(parent, width:, height:, opts: FRAME_SUNKEN | LAYOUT_FILL)
    super(parent, opts: opts, width: width, height: height)

    main_frame = FXVerticalFrame.new(self, opts: LAYOUT_FILL)

    @table = FXTable.new(main_frame, opts: LAYOUT_FILL | TABLE_READONLY)
    setup_table
    fill_table(0)
    setup_paging_controls(main_frame)
  end

  def setup_table
    @table.setTableSize(20, 5)

    @table.setRowHeaderWidth(30)

    @table.setColumnText(0, "№")
    @table.setColumnWidth(0, 30)

    @table.setColumnText(1, "Фамилия и Инициалы")
    @table.setColumnWidth(1, 160)

    @table.setColumnText(2, "Дата рождения")
    @table.setColumnWidth(2, 120)

    @table.setColumnText(3, "Гит")
    @table.setColumnWidth(3, 200)

    @table.setColumnText(4, "Контакт")
    @table.setColumnWidth(4, 225)
  end

  def fill_table(page)
    @data = [
      ["Петров П.П.", "1999-05-20", "https://github.com/petrov", "+7-900-234-5678"],
      ["Иванов И.И.", "2000-01-01", "https://github.com/ivanov", "+7-900-123-4567"],
      ["Сидоров С.С.", "2001-11-15", "https://github.com/sidorov", "+7-900-345-6789"]
    ]
    
    start_row = page * 20
    demo_data = @data

    (0...20).each do |row|
      @table.setItemText(row, 0, "")
      @table.setItemText(row, 1, "")
      @table.setItemText(row, 2, "")
      @table.setItemText(row, 3, "")
      @table.setItemText(row, 4, "")
    end

    (start_row...(start_row + 20)).each_with_index do |index, row|
      break if index >= demo_data.size
      data = demo_data[index % demo_data.size]
      @table.setItemText(row, 0, (index + 1).to_s)
      @table.setItemText(row, 1, data[0])
      @table.setItemText(row, 2, data[1])
      @table.setItemText(row, 3, data[2])
      @table.setItemText(row, 4, data[3])
    end

    @max_page = (demo_data.size / 20.0).ceil
  end

  def setup_paging_controls(main_frame)
    paging_frame = FXHorizontalFrame.new(main_frame, opts: LAYOUT_FILL_X | LAYOUT_LEFT)

    @prev_button = FXButton.new(paging_frame, "Предыдущая", opts: FRAME_RAISED)
    
    @page_info_label = FXLabel.new(paging_frame, "", opts: LAYOUT_CENTER_X | LAYOUT_CENTER_Y)
    @current_page = 0
    update_page_info
    @next_button = FXButton.new(paging_frame, "Следующая", opts: FRAME_RAISED)

    @prev_button.connect(SEL_COMMAND) do
      if @current_page > 0
        @current_page -= 1
        fill_table(@current_page)
        update_page_info
      end
    end

    @next_button.connect(SEL_COMMAND) do
      if @current_page < @max_page - 1
        @current_page += 1
        fill_table(@current_page)
        update_page_info
      end
    end
  end

  def update_page_info
    @page_info_label.text = "Page #{@current_page + 1} / #{@max_page}"
  end
end

