require 'rspec'
require 'bb2md'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
