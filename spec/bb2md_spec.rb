require 'spec_helper'

describe Bb2md do
  it "keeps plain text untouched" do
    converter = Bb2md::Converter.new
    converter.convert("Some text").should == "Some text"
  end
end
