require_relative 'student.rb'

class Node

  attr_accessor :left, :right, :data

  def initialize(left: nil, right: nil, data:)
    self.data = data
    self.left = left
    self.right = right
  end

  def each(&block)
    yield self
    left.each(&block) if left
    right.each(&block) if right
  end

  def to_s
    data.to_s
  end

end
