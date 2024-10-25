require_relative 'student.rb'
require_relative 'node.rb'

class Binary_Tree

  include Enumerable

  attr_accessor :root

  private :root=

  def initialize(obj_array)
    if obj_array.nil?
      raise ArgumentError.new('Неверный тип аргумента')
    end

    self.root = Node.new(left: nil, right: nil, data: obj_array[0])

    obj_array[1..].each do |obj|
      add_node(self.root, obj)
    end

  end

  def add_node(node, obj)
    if obj < node.data
      if node.left.nil?
        node.left = Node.new(left: nil, right: nil, data: obj)
      else
        add_node(node.left, obj)
      end

    else
      if node.right.nil?
        node.right = Node.new(left: nil, right: nil, data: obj)
      else
        add_node(node.right, obj)
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
