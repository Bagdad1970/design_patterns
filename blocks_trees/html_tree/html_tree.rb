require_relative 'tag'
require './html_parser.rb'

class HTML_Tree

  include HTML_Parser

  attr_accessor :root, :tag_stack

  private :root=, :tag_stack=

  @@void_tags = ['area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input', 'link', 'meta', 'param', 'source', 'track', 'wbr']

  def initialize(html_string)
    hash_tags = HTML_Parser.parsing_html(html_string)
    
    root_tag = hash_tags[0]
    self.root = Tag.new(name: root_tag[:name], features: root_tag[:features], info: root_tag[:info], parent: nil, children: [])
    self.tag_stack = [self.root.name]

    add_node(self.root, hash_tags, 1)
  end

  def HTML_Tree.create_from_file(filepath)
    html_strings = HTML_Parser.read_html_from_file(filepath)
    self.new(html_strings)
  end

  def HTML_Tree.is_tag_closing?(open_tag, close_tag)
    (open_tag != close_tag) && (open_tag == close_tag.sub('/', ''))
  end

  def HTML_Tree.is_tag_void?(tag)
    @@void_tags.include?(tag.sub('>', '').sub('<', ''))
  end

  def add_node(node, hash_tags, i)
    if i < hash_tags.size
      if HTML_Tree.is_tag_void?(hash_tags[i][:name]) == true
        hash_tag = hash_tags[i]
        new_node = Tag.new(name: hash_tag[:name], features: hash_tag[:features], info: nil, children: [], parent: node)
        node.children.append(new_node)

        add_node(node, hash_tags, i+=1)
      elsif HTML_Tree.is_tag_closing?(self.tag_stack.last, hash_tags[i][:name]) == true
        self.tag_stack.pop

        add_node(node.parent, hash_tags, i+=1)
      else
        hash_tag = hash_tags[i]
        new_node = Tag.new(name: hash_tag[:name], features: hash_tag[:features], info: hash_tag[:info], children: [], parent: node)
        node.children.append(new_node)

        self.tag_stack.append(hash_tag[:name])

        add_node(new_node, hash_tags, i+=1)
      end
    end
  end

end
