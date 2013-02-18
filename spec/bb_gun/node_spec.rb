require 'spec_helper'

module BbGun
  describe Node do
    it "has content Text, Tag or Root content" do
      node = Node.new(Tag.new('url')).content.should be_a(Tag)
      node = Node.new(Text.new('Text')).content.should be_a(Text)
      node = Node.new(Root.new).content.should be_a(Root)
    end

    it "raises exception if content is not Tag, Text or Root" do
      lambda { Node.new('just checking') }.should raise_error(
        ArgumentError, "Content can be Tag or Text type only."
      )
    end

    it "has children" do
      Node.new(Root.new).children.should == []
    end
  end
end
