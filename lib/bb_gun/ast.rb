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

class Array
  def select_indice(&p)
    map.with_index{|x, i| i if p.call(x)}.compact
  end
end

module BbGun
  class Ast

    # Public: text to process.
    attr_reader :text

    # Public: Array with parts of text (tags' openings,
    # endings and text parts)
    attr_reader :text_elements

    # Public: Root Node.
    attr_reader :root

    # Public: Current Node.
    attr_reader :current

    attr_reader :text_length

    def initialize(text)
      @text = text
    end

    def build
      create_root
      self
    end

    def extract_text_elements
      @text_elements = text.split(/(\[[\w=\/]+.*?\])/)
      join_between_code_text_elements
      text_elements
    end

    def add_text_node(val)
      current.children << Node.new(Text.new(val))
    end

    private

    def join_between_code_text_elements
      code_indexes = text_elements.select_indice {|t| t =~ /\[[\/]*code[=]*.*?\]/ }
      code_indexes.each_slice(2) do |s|
        first = s.first + 1
        last = s.last - 1
        @text_elements[first..last] = text_elements[first..last].join
      end
    end

    def create_root
      @root = @current = Node.new(Root.new)
    end
  end
end
