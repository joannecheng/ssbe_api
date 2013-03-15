require 'spec_helper'

describe MethodComments do
  describe '#initialize' do
    it 'sets accessor comments to an array' do
      string = "# Escalation collection\n#\n# Returns a collection of escalations visible to user\n"
      mc = MethodComments.new string
      mc.comments.should == ["Escalation collection", "Returns a collection of escalations visible to user"]
    end
  end
end
