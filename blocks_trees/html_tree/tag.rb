class Tag

  include Comparable

  attr_accessor :children, :parent, :name, :features, :info
  
  def initialize(name: , features: nil, info: nil, children: nil, parent: nil)
    self.name = name
    self.features = features
    self.info = info
    self.children = children
    self.parent = parent
  end

  def <=>(other)
    self.name <=> other.name
  end

  def each_dfs(&block)
    yield self
    children.each{|node| node.each_dfs(&block)} if children
  end

  def each_bfs(&block)
    queue = [self]
    while !(queue.empty?)
      current_node = queue.shift
      yield current_node
      current_node.children.each do |child|
        queue.append(child)
      end
    end
  end

  def has_tag_features?  # boolean
    !(self.features.nil?)
  end

  def children_size  # integer
    self.children.size
  end

  def tag_name  # string
    self.name
  end

  def to_s
    "Тег: #{@name} #{@features}#{@info}\n"
  end

end
