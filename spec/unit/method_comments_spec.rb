require 'spec_helper'

describe MethodComments do
  describe '#initialize' do
    it 'sets accessor comments to an array' do
      string = "# Escalation collection\n#\n# Returns a collection of escalations visible to user\n"
      mc = MethodComments.new string
      mc.comments.should == ["Escalation collection", "Returns a collection of escalations visible to user"]
    end
  end
  
  describe '#summary' do
    it 'returns a summary' do
      string = "# Escalation collection\n#\n# Returns a collection of escalations visible to user\n"
      mc = MethodComments.new string
      mc.summary.should == "Escalation collection"
    end
  end

  describe '#return' do
    it 'returns what the method returns' do
      string = "# Escalation collection\n#\n# Returns a collection of escalations visible to user\n"
      mc = MethodComments.new string
      mc.return.should == "Returns a collection of escalations visible to user"
    end
  end

  describe '#params' do
    context 'params' do
      it 'returns an hash of params' do
        string = "# Escalation collection\n#\n\# @param id - escalation id\n # @param test_param - testing parameters\n# Returns a collection of escalations visible to user\n"
        mc = MethodComments.new string
        mc.params.should == {'id' => 'escalation id', 'test_param' => 'testing parameters'}
      end

      it 'properly parses parameters' do
        string = "# Escalation collection\n#\n\# @param id - escalation id\n # @param test_param[blaah] - testing hash parameters\n# Returns a collection of escalations visible to user\n"
        mc = MethodComments.new string
        mc.params.should == {'id' => 'escalation id', 'test_param[blaah]' => 'testing hash parameters'}
      end

      it 'properly parses parameters if there is no last line' do
        string = "# Escalation collection\n#\n\# @param id - escalation id\n # @param test_param[blaah] - testing hash parameters\n\n"
        mc = MethodComments.new string
        mc.params.should == {'id' => 'escalation id', 'test_param[blaah]' => 'testing hash parameters'}
      end

    end

    context 'no params' do
      it 'returns an empty hash' do
        string = "# Escalation collection\n#\n# Returns a collection of escalations visible to user\n"
        mc = MethodComments.new string
        mc.params.should == {}
      end
    end
  end
end
