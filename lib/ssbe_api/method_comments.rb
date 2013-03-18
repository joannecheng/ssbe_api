class MethodComments
  attr_accessor :comments

  def initialize comment_string
    @comments = comment_string.gsub("#", "").split(/\n+/).map { |comment| comment.gsub(/^\s+/, "") }
  end

  def summary 
    @comments.first
  end

  def return
    @comments.last
  end

  def params
    params_hash = {}
    params_line_regex = /@param\s+?(\w+)\s+?-\s+?(.+)/
    middle_lines = @comments[1..-2]
    return params_hash if middle_lines.nil?

    param_strings = middle_lines.select { |line| line =~ /@param/}
    param_strings.each{ |param_string| params_hash.merge!(Hash[*param_string.scan(params_line_regex).flatten]) }
    params_hash
  end

end
