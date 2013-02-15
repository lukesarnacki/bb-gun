# encoding: UTF-8

require "bb_gun/version"

module BbGun

  class Converter
    attr_reader :input, :options

    def initialize(input, options = {})
      @input = input
      @options = options
    end

    def to_markdown
      input
    end

    def self.to_markdown(input)
      new(input).to_markdown
    end
  end
end
