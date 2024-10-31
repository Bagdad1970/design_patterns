class Tag

  attr_accessor :children, :parent, :name, :features, :info
  
  def initialize(name: , features: nil, info: nil, children: [], parent: nil)
    self.name = name
    self.features = features
    self.info = info
    self.children = children
    self.parent = parent
  end

  def has_tag_features?  # bolean
    !(self.features.nil?)
  end

  def children_size  # integer
    self.children.size
  end

  def tag_name  # string
    self.name
  end

  def to_s
    "Тег: #{@name} #{@features}#{@info}\nРодитель: #{@parent} Дети: #{@children}"
  end

end
