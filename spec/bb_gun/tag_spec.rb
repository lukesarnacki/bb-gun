require 'spec_helper'

module BbGun
  describe Tag do
    it 'has tag name' do
      Tag.new('url').name.should == 'url'
    end

    it 'can have value' do
      Tag.new('url').value.should == nil
      Tag.new('url', 'http://google.com').value.should == 'http://google.com'
    end
  end
end
