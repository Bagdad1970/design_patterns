require_relative 'data_list.rb'
require_relative 'data_table.rb'

class Data_List_Student_Short < Data_List

  def initialize(student_short_array)
    super(student_short_array)
  end

  def get_names
    object_fields = self.sorted_array.first[:data].instance_variables
    object_fields.delete(:@id)

    return object_fields
  end

  def get_data(attribute_names)
    matrix = Array.new()
    self.sorted_array.each_with_index do |elem, index|
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
 
  def to_s
    self.sorted_array.to_s
  end

end

