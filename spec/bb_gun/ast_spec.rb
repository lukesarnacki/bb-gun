require 'spec_helper'

module BbGun
  describe Ast do
    it "creates tree with one node if only text given" do
      ast = Ast.new("Some text").build

      nodes = ast.root.children
      nodes.count.should == 1
      text = nodes.first.content
      text.should be_a(Text)
      text.content.should == "Some text"
    end

    context "on complicated text" do

      before do
       @text = "Some text [b]which is strong and "
       @text += "[i]itaclics with [url=http://google.com]link[/url] "
       @text += "to make things[/i] harder with [ distraction[/b]..."
      end


      it "creates text_elements array" do
        ast = Ast.new(@text)

        ast.extract_text_elements

        ast.text_elements.should == [
          'Some text ', '[b]', 'which is strong and ', '[i]', 'itaclics with ',
          '[url=http://google.com]', 'link', '[/url]', ' to make things',
          '[/i]', ' harder with [ distraction', '[/b]', '...'
        ]
      end


      it "creates tree from text with BB code tags" do
        ast = Ast.new(@text).build

        nodes = ast.root.children
        nodes.count.should == 2
        node = nodes.first
        node.content.should be_a(Text)
        node.content.content.should == "Some text"

        node = nodes.last
        node.content.should be_a(Tag)
        node.content.name.should == 'b'

        b_children = node.children

        node = b_children.first
        node.content.should be_a(Text)
        node.content.content.should == "which is strong and "

        node = b_children[1]
        node.content.should be_a(Tag)
        node.content.name.should == 'i'

        i_children = node.children

        node = b_children.last
        node.content.should be_a(Text)
        node.content.content.should == " harder"

        node = i_children.first
        node.content.should be_a(Text)
        node.content.content.should == "italics with "

        node = i_childre[1]
        node.content.should be_a(Tag)
        node.content.name.should == 'i'
        node.content.value.should == "http://google.com"

        url_children = node.children

        node = i_children.last
        node.content.should be_a(Text)
        node.content.content.should == " to make things"

        node = url_children.first
        node.content.should be_a(Text)
        node.content.content.should == "link"
      end
    end
  end
end
