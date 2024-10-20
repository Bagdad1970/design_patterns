require_relative 'student.rb'
require_relative 'node.rb'

class Binary_Tree

  include Enumerable

  attr_accessor :root

  private :root=

  def initialize(student_array)
    if student_array.nil?
      raise ArgumentError.new('Неверный тип аргумента')
    end

    self.root = Node.new(left: nil, right: nil, data: student_array[0])

    student_array[1..].each do |student|
      add_node(self.root, student)
    end

  end

  def add_node(node, student)
    if student.birthdate < node.data.birthdate
      if node.left.nil?
        node.left = Node.new(left: nil, right: nil, data: student)
      else
        add_node(node.left, student)
      end

    else
      if node.right.nil?
        node.right = Node.new(left: nil, right: nil, data: student)
      else
        add_node(node.right, student)
      end
    end

  end

  def each(&block)
    self.root.each(&block)
  end

  def print_NLR(node)
    if !(node.nil?)
      puts node.data
      print_NLR(node.left)
      print_NLR(node.right)
    end
  end

  def to_s
    print_NLR(self.root)
  end

end
