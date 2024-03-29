# A tree is considered a binary search tree (BST) if for each of its nodes the following is true:

# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and the right subtrees must also be binary search trees.
# Removing a value x from a BST t is done in the following way:

# If there is no x in t, nothing happens;
# Otherwise, let t' be a subtree of t such that t'.value = x.
# If t' has a left subtree, remove the rightmost node from it and put it at the root of t';
# Otherwise, remove the root of t' and its right subtree becomes the new t's root.
# For example, removing 4 from the following tree has no effect because there is no such value in the tree:

#     5
#    / \
#   2   6
#  / \   \
# 1   3   8
#        /
#       7
# Removing 5 causes 3 (the rightmost node in left subtree) to move to the root:

#     3
#    / \
#   2   6
#  /     \
# 1       8
#        /
#       7
# And removing 6 after that creates the following tree:

#     3
#    / \
#   2   8
#  /   /
# 1   7
# You're given a binary search tree t and an array of numbers queries. Your task is to remove queries[0], queries[1], etc., from t, step by step, following the algorithm above. Return the resulting BST.


def deleteOneFromBST(t, n)
    return t if t == nil
    if t.value == n 
        if t.left != nil 
            x = t.left 
            y = t
            while x.right != nil  
                y = x
                x = x.right
            end
            
            if x == y.right 
                y.right = x.left
                x.left = t.left 
                x.right = t.right
            else 
                x.left = t.left.left 
                x.right = t.right
            end
            
            return x
        else 
            return t.right
        end
    else 
        if t.value > n 
            t.left = deleteOneFromBST(t.left, n)
        else 
            t.right = deleteOneFromBST(t.right, n)
        end
        
        return t
    end
end

def deleteFromBST(t, queries)
    queries.each{|q| t = deleteOneFromBST(t, q)}
    return t
end