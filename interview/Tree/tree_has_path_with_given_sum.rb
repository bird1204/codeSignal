# Given a binary tree t and an integer s, 
# determine whether there is a root to leaf path in t such that the sum of vertex values equals s.

# Example

# For
# t = {
#     "value": 4,
#     "left": {
#         "value": 1,
#         "left": {
#             "value": -2,
#             "left": null,
#             "right": {
#                 "value": 3,
#                 "left": null,
#                 "right": null
#             }
#         },
#         "right": null
#     },
#     "right": {
#         "value": 3,
#         "left": {
#             "value": 1,
#             "left": null,
#             "right": null
#         },
#         "right": {
#             "value": 2,
#             "left": {
#                 "value": -2,
#                 "left": null,
#                 "right": null
#             },
#             "right": {
#                 "value": -3,
#                 "left": null,
#                 "right": null
#             }
#         }
#     }
# }
# and
# s = 7,
# the output should be hasPathWithGivenSum(t, s) = true.

# This is what this tree looks like:

#       4
#      / \
#     1   3
#    /   / \
#   -2  1   2
#     \    / \
#      3  -2 -3
# Path 4 -> 3 -> 2 -> -2 gives us 7, the required sum.

# For

# t = {
#     "value": 4,
#     "left": {
#         "value": 1,
#         "left": {
#             "value": -2,
#             "left": null,
#             "right": {
#                 "value": 3,
#                 "left": null,
#                 "right": null
#             }
#         },
#         "right": null
#     },
#     "right": {
#         "value": 3,
#         "left": {
#             "value": 1,
#             "left": null,
#             "right": null
#         },
#         "right": {
#             "value": 2,
#             "left": {
#                 "value": -4,
#                 "left": null,
#                 "right": null
#             },
#             "right": {
#                 "value": -3,
#                 "left": null,
#                 "right": null
#             }
#         }
#     }
# }
# and
# s = 7,
# the output should be hasPathWithGivenSum(t, s) = false.

# This is what this tree looks like:

#       4
#      / \
#     1   3
#    /   / \
#   -2  1   2
#     \    / \
#      3  -4 -3
# There is no path from root to leaf with the given sum 7.


def hasPathWithGivenSum(t, s)
  cal(t, s)
end

def cal(tree, s)
  return s == 0 if tree.nil?
  sub_sum = s - tree.value
  return true if not tree.left.nil? and cal(tree.left, sub_sum)
  return true if not tree.right.nil? and cal(tree.right, sub_sum)
  return true if tree.left.nil? && tree.right.nil? && sub_sum == 0
  false
end