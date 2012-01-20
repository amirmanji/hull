require 'spec_helper'

describe Hull do
  describe "Parsing arguments" do
    it "should handle bad args" do
      commands = [ '', 'asdf', 'foo' ]
      commands.each do |command|
        hull = Hull::Hull.new(command)
        hull.command.should == 'help'
        hull.number.should be_nil
      end
    end

    it "should handle good args" do
      commands = %w(list show pull rm)
      commands.each do |command|
        args = "#{command} 10"
        hull = Hull::Hull.new(args)
        hull.command.should == 'help'
        hull.number.should be_nil
      end
    end
  end

  it "should run list" do
    command = Hull::Hull.new('list')
    List.expects(:new).once
    command.run
=begin
    command = Command.new('show')
    Show.expects(:new).once
    command.run

    command = Command.new('pull')
    Pull.expects(:new).once
    command.run

    command = Command.new('rm')
    Remove.expects(:new).once
    command.run

    command = Command.new('help')
    Help.expects(:new).once
    command.run
=end
  end
end
