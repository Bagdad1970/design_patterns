require './n_tree.rb'

def main
  begin
    html_tree = HTML_Tree.create_from_file('./index.html')

    p html_tree

  rescue => error
    puts error
  end

end

main
