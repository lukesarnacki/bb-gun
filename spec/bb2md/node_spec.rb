require 'spec_helper'

module Bb2md
  describe Node do
    it "has type" do
      node = Node.new(type: 'text')
      node.type.should == 'text'

      #n = Node.new(content: "Some url", tag: "url",
                   #value: "http://google.pl", type: "tag")

      #n.content.should == "Some url"
      #n.tag.should == "url"
      #n.value.should == "http://google.pl"
      #n.type.should == "tag"
    end
  end
end
