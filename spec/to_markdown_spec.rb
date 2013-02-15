# encoding: UTF-8

require 'spec_helper'

describe BbGun do

  describe "#to_markdown" do

    it "converts bold tag" do
      described_class.new("[b]bold[b]").to_markdown.should == "**bold**"
    end

    # Markdown doesn't support underlined text
    it "converts underlined tag to italic" do
      described_class.new("[u]underline[/u]").to_markdown.should == "*underline*"
    end

    it "converts italic tag" do
      described_class.new("[i]italic[/i]").to_markdown.should == "*italic*"
    end

    it "converts strikethrough tag" do
      described_class.new("[s]strikethrough[/s]").to_markdown.should == "~~ strikethrough ~~"
    end

    it "removes color tag with RGB value" do
      described_class.new("[color=#FFFFFF]white[/color]").to_markdown.should == "white"
    end

    it "converts color with tag english name" do
      described_class.new("[color=blue]blue[/color]").to_markdown.should == "blue"
    end

    it "converts url tag with name" do
      described_class.new("[url=http://rubyonrails.pl/forum/]Ruby on Rails PL Forum[/url]").to_markdown.should == \
        "[Ruby on Rails PL Forum](http://rubyonrails.pl/forum/)"
    end

    it "converts url tag without name" do
      described_class.new("[url]http://rubyonrails.pl/forum/[/url]").to_markdown.should == \
        "[http://rubyonrails.pl/forum/](http://rubyonrails.pl/forum/)"
    end

    it "converts e-mail tag with name" do
      described_class.new("[email]myname@mydomain.com[/email]").to_markdown.should == \
        "[myname@mydomain.com](mailto:myname@mydomain.com)"
    end

    it "converts e-mail tag without name" do
      described_class.new("[email=myname@mydomain.com]Mój adres email[/email] ").to_markdown.should == \
        "[Mój adres email](mailto:myname@mydomain.com)"
    end

    it "converts image tag" do
      described_class.new("[img]http://i2.kym-cdn.com/entries/icons/original/000/000/007/rickroll.jpg[/img]").to_mardhown.should == \
        "![](http://i2.kym-cdn.com/entries/icons/original/000/000/007/rickroll.jpg)"
     end

    it "converts embed tags" do
      described_clas.new("[b]Bold [i]Italic[/i][/b]").to_mardown.should == "**Bold *Italic***"
    end

    it "converts multiline embed tags" do
      described_clas.new("[b]Bold\n\n[i]Italic\n\n New Line[/i][/b]").to_mardown.should == "**Bold**\n\n***Italic***\n\n***New Line***"
    end

    it "is not case sensitive" do
      described_clas.new("[b]Bold\n\n[I]Italic\n\n New Line[/i][/B]").to_mardown.should == "**Bold**\n\n***Italic***\n\n***New Line***"
    end

  end

end
