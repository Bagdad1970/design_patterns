require './html_tree_dfs.rb'
require './html_tree_bfs.rb'

def main
  begin
    html_tree = HTML_Tree.create_from_file('./index.html')

    p html_tree

    html_tree_dfs = HTML_Tree_DFS.create_from_file('./index.html')
    html_tree_dfs.each{|node| puts "#{node}\n"}
    puts html_tree_dfs.count

    html_tree_bfs = HTML_Tree_BFS.create_from_file('./index.html')
    html_tree_bfs.each{|node| puts "#{node}\n"}

    puts html_tree_dfs.count{|tag| tag.features.nil?}

  rescue => error
    puts error
  end

end

main
