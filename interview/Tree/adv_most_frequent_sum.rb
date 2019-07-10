# The sum of a subtree is the sum of all the node values in that subtree, including its root.

# Given a binary tree of integers, find the most frequent sum (or sums) of its subtrees.

# Example

# For
# t = {
#     "value": 1,
#     "left": {
#         "value": 2,
#         "left": null,
#         "right": null
#     },
#     "right": {
#         "value": 3,
#         "left": null,
#         "right": null
#     }
# }
# the output should be
# mostFrequentSum(t) = [2, 3, 6].
# 1st example

# Since all the sum values in this tree occur only once, return all of them in ascending order.

# For
# t = {
#     "value": -2,
#     "left": {
#         "value": -3,
#         "left": null,
#         "right": null
#     },
#     "right": {
#         "value": 2,
#         "left": null,
#         "right": null
#     }
# }
# the output should be
# mostFrequentSum(t) = [-3].
# 2nd example

# There are 3 subtree sums for this tree: -2 + (-3) + 2 = -3, -3, and -2. The most frequent sum is -3 since it appears twice.

#
# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
def mostFrequentSum(t)
    hash = Hash.new(0)
    build_count(t, hash) #side effect is to build the hash. Can I make this functional. 
    p hash
    #return the most frequent sum:
    #select the keys whose value equals the max value, then sort.
    hash.select{|sum, count| count == hash.values.max}.keys.sort
end

def build_count(t, hash = Hash.new(0))
    if t == nil 
        return 0
    elsif t.left == nil && t.right == nil 
        hash[t.value] += 1
        return t.value
    else 
        sum = build_count(t.left, hash) + t.value + build_count(t.right, hash)
        hash[sum] += 1
        return sum
    end 
end 

