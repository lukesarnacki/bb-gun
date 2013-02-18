module BbGun
  class Node
    # Public: Returns the String with Node's type. Available values are:
    #         tag - node has tah object
    #         text
    attr_reader :content

    attr_reader :children

    def initialize(content)
      @content = content
      @children = []
      validate_content
    end

    private

    def validate_content
      raise ArgumentError, "Content can be Tag or Text type only." unless
        [Tag, Text, Root].include? content.class
    end
  end
end
