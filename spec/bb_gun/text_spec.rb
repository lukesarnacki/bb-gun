require 'spec_helper'

module BbGun
  describe Text do
    it 'has text content' do
      Text.new('Some text').content.should == 'Some text'
    end
  end
end

