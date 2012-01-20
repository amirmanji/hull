require 'spec_helper'

describe Puller do
  describe "Parsing arguments" do
    it "should handle empty args" do
      args = ""
      puller = Puller.new(args)
      puller.command.should == 'help'
      puller.number.should be_nil
    end
  end
end
