class MethodComments
  attr_accessor :comments

  def initialize comment_string
    @comments = comment_string.gsub("#", "").split(/\n+/).map { |comment| comment.gsub(/^\s+/, "") }
  end

end
