module HTML_Parser

  def HTML_Parser.read_html_from_file(filepath)
    html_strings = String.new()

    File.open(filepath, 'r') do |file|
      file.each_line do |line|
        html_strings += line.chop.strip
      end
    end

    return html_strings
  end

  def HTML_Parser.to_tag_form(string)
    '<' + string.sub('>', '').sub('<', '') + '>'
  end

  def HTML_Parser.get_hash_of_html_tag(html_tag)
    space_index = html_tag.index(' ')

    if space_index.nil?
      return {name: to_tag_form(html_tag), features: nil, info: nil}
    end

    tag_name = html_tag[...space_index]
    tag_features = html_tag[space_index+1..]

    return {name: to_tag_form(tag_name), features: tag_features, info: nil}
  end

  def HTML_Parser.parsing_html(html_string)
    if html_string.empty?
      return nil
    end

    hash_tags = []

    start_tag_indexes = (0...html_string.size).find_all {|i| html_string[i] == '<'}
    end_tag_indexes = (0...html_string.size).find_all {|i| html_string[i] == '>'}

    end_tag_indexes.each_index do |index|
      tag_info = nil
      if index < end_tag_indexes.size - 1 && (start_tag_indexes[index+1] - end_tag_indexes[index]) > 1
        tag_info = html_string[end_tag_indexes[index]+1...start_tag_indexes[index+1]]  # writing tag info between end of current tag and start of next tag
      end

      tag_hash = get_hash_of_html_tag(html_string[start_tag_indexes[index]...end_tag_indexes[index]])
      tag_hash[:info] = tag_info
      hash_tags.append(tag_hash)
    end

    return hash_tags
  end


end
