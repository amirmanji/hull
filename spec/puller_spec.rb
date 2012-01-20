require 'spec_helper'

describe Puller do
  describe "Parsing arguments" do
    it "should handle bad args" do
      commands = [ '', 'asdf', 'foo' ]
      commands.each do |command|
        puller = Puller.new(command)
        puller.command.should == 'help'
        puller.number.should be_nil
      end
    end

    it "should handle good args" do
      commands = %w(list show get rm)
      commands.each do |command|
        args = "#{command} 10"
        puller = Puller.new(args)
        puller.command.should == 'help'
        puller.number.should be_nil
      end
    end
  end
end
