module BbGun
  class Tag
    # Public: A String with bb tag's name (i.e. 'b' or 'quote').
    attr_reader :name

    # Public: A string with bb tag's value, i.e. if tag is 'url', then value could
    # be 'http://google.com'
    attr_reader :value

    def initialize(name, value = nil)
      @name = name
      @value = value
    end
  end
end
