require 'spec_helper'

describe Hull do
  describe "Parsing arguments" do
    it "should handle bad args" do
      commands = [ '', 'asdf', 'foo' ]
      commands.each do |command|
        command = Command.new(command)
        command.command.should == 'help'
        command.number.should be_nil
      end
    end

    it "should handle good args" do
      commands = %w(list show pull rm)
      commands.each do |command|
        args = "#{command} 10"
        command = Command.new(args)
        command.command.should == 'help'
        command.number.should be_nil
      end
    end
  end
end
