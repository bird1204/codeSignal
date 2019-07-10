# ou have a binary tree t. Your task is to find the largest value in each row of this tree. In a tree, a row is a set of nodes that have equal depth. For example, a row with depth 0 is a tree root, a row with depth 1 is composed of the root's children, etc.

# Return an array in which the first element is the largest value in the row with depth 0, the second element is the largest value in the row with depth 1, the third element is the largest element in the row with depth 2, etc.

# Example

# For

# t = {
#     "value": -1,
#     "left": {
#         "value": 5,
#         "left": null,
#         "right": null
#     },
#     "right": {
#         "value": 7,
#         "left": null,
#         "right": {
#             "value": 1,
#             "left": null,
#             "right": null
#         }
#     }
# }
# the output should be largestValuesInTreeRows(t) = [-1, 7, 1].

# The tree in the example looks like this:

#     -1
#    / \
#   5   7
#        \
#         1
# In the row with depth 0, there is only one vertex - the root with value -1;
# In the row with depth 1, there are two vertices with values 5 and 7, so the largest value here is 7;
# In the row with depth 2, there is only one vertex with value 1.
def largestValuesInTreeRows(t)
  return [] if t.nil?
  values = print_tree([[t, 0]])
  values.keys.sort.map do |level|
    values[level].max
  end
end


def print_tree(queue)
  all_level = {}
  while !queue.empty?
    node, level = queue.shift
    all_level[level] ||= []
    all_level[level] << node.value
    queue << [node.left, level + 1] unless node.left.nil?
    queue << [node.right, level + 1] unless node.right.nil?
  end
  all_level
end