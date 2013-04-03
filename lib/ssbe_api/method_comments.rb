class MethodComments
  attr_accessor :comments

  def initialize comment_string
    @comments = comment_string.gsub("#", "").split(/\n+/).map { |comment| comment.gsub(/^\s+/, "") }
  end

  def summary 
    @comments.first
  end

  def return
    if @comments.last =~ /@param/
      @comments.first
    else
      @comments.last
    end
  end

  def params
    params_hash = {}
    params_line_regex = /@param\s+?(\S+)\s+?-\s+?(.+)/
    return params_hash if @comments.nil?

    param_strings = @comments.select { |line| line =~ /@param/}
    param_strings.each{ |param_string| params_hash.merge!(Hash[*param_string.scan(params_line_regex).flatten]) }
    params_hash
  end

end
