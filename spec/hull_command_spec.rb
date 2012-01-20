require 'spec_helper'

describe Hull::Command do
  before :each do
    @command = Hull::Command.new
  end

  describe "should parse git data" do
    before :each do
      config = { 'remote.origin.url' => 'git@github.com:foo/bar.git' }
      @repo = mock()
      @repo.stubs(:config).returns(config)
      @command.stubs(:repo).returns(@repo)
    end

    it "should parse github_url" do
      expected = "https://github.com/api/v2/json/pulls/foo/bar"
      @command.github_url.should == expected
    end

    it "should validate repository type" do
      good_remote_list = [ 'origin' ]
      @repo.stubs(:remote_list).returns(good_remote_list)
      @command.valid_repository?(@repo).should be_true
    end

    it "should invalidate repository type" do
      bad_remote_list = [ 'foo' ]
      @repo.stubs(:remote_list).returns(bad_remote_list)
      @command.valid_repository?(@repo).should_not be_true
    end
  end
end
