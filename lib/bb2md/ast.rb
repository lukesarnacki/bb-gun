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

module Bb2md
  class Ast
  end
end
