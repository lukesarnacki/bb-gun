require 'spec_helper'

describe BbGun do
  it "keeps plain text untouched" do
    converter = BbGun::Converter.new
    converter.convert("Some text").should == "Some text"
  end
end
