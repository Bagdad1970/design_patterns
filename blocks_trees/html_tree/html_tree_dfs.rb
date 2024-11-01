require_relative 'html_tree'

class HTML_Tree_DFS < HTML_Tree

  include Enumerable

  def initialize(html_string)
    super(html_string)
  end

  def HTML_Tree.create_from_file(filepath)
    html_strings = read_html_from_file(filepath)
    self.new(html_strings)
  end

  def each(&block)
    self.root.each_dfs(&block)
  end

end
