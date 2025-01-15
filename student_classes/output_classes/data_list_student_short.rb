require_relative 'data_list.rb'
require_relative 'data_table.rb'

class Data_List_Student_Short < Data_List

  attr_accessor :view
  private :view=

  def initialize(student_short_array=[])
    super(student_short_array)
  end

  def set_view(view)
    self.view = view
  end

  def get_names
    object_fields = self.data_list.first[:data].instance_variables
    object_fields.delete(:@id)
    return object_fields
  end

  def get_data(attribute_names)
    matrix = Array.new()
    self.data_list.each_with_index do |elem, index|
      object = elem[:data]
      row = [index+1]
      
      attribute_names.each_with_index do |attribute_name|
        row.append(object.instance_variable_get(attribute_name))
      end

      matrix.append(row)
    end
    
    return Data_Table.new(matrix)
  end

  private :get_names, :get_data

  def notify
    column_names = self.get_names.reduce([]) {|array, symbol_name| array << symbol_name.to_s}
    column_names.unshift('id')
    column_names.map! {|name| name.gsub('@', '').capitalize}
    self.view.set_table_params(column_names, 20)

    data_table = self.get_data_table
    self.view.set_table_data(data_table)
  end
 
  def to_s
    self.data_list.to_s
  end

end

