# Internal: Abstract Syntax tree for text with bb code tags.
#
# Example structure is shown below.
#
# text: "Some text [b]which is strong but also [i]itaclics[/i][/b]."

# Node(
#   content: Root(),
#   children: [
#     Node(
#       content: Text(content: 'Some Text')
#     ),
#     Node(
#       content: Tag(name: 'b', value: nil)
#       children: [
#         Node(
#           content: Text(content 'which is strong but also')
#         ),
#         Node(
#           content: Tag(name: 'i', value: nil)
#           children: [
#             Node(
#               content: Text(content: 'italics')
#             )
#           ]
#         )
#       ]
#     )
#   ]
# )

TAGS = %w(b u i color url email img quote code)

module BbGun
  class Ast

    # Public: text to process.
    attr_reader :text

    attr_reader :text_elements
    attr_accessor :current_element
    attr_accessor :text_left

    # Public: Root Node.
    attr_reader :root

    # Public: Current Node.
    attr_reader :current

    attr_reader :text_length

    def initialize(text)
      @text = @text_left = text
      @text_elements = []
      @current_element = ""
      @text_length = text.length
    end

    def build
      create_root
      create_nodes
      self
    end

    def append_to_current_element(length = 1)
      self.current_element << text_left[0..(length - 1)]
      self.text_left = text_left[length..text_left.length - 1]
    end

    def add_current_element
      self.text_elements << current_element.dup
    end

    def next_element
      add_current_element
      self.current_element = ""
    end

    def first_tag
      text_left.scan(/^\[([\w=\/]+.*?)\]/).flatten.first
    end

    def process_tag
      unless first_tag.nil?
        next_element
        append_to_current_element(first_tag.length + 2)
        next_element
      else
        append_to_current_element
      end
    end

    def first_character
      text_left[0]
    end

    def process_text
      case first_character
      when "["
        process_tag
      else
        append_to_current_element
      end
      extract_text_elements
    end

    def extract_text_elements
      unless text_left.nil?
        process_text
      else
        add_current_element
      end
    end

    def add_text_node(val)
      current.children << Node.new(Text.new(val))
    end

    private

    def create_root
      @root = @current = Node.new(Root.new)
    end
  end
end
