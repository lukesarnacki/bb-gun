require 'spec_helper'

describe Bb2md do
  it "should convert to bb code" do
    converter = Bb2md::Converter.new
    converter.convert("Some text").should == "Some text"
  end
end
