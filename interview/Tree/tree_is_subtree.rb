# Given two binary trees t1 and t2, 
# determine whether the second tree is a subtree of the first tree. 
# A subtree for vertex v in a binary tree t is a tree consisting of v and 
# all its descendants in t. Determine whether or not there is a vertex v (possibly none) in 
# tree t1 such that a subtree for vertex v (possibly empty) in t1 equals t2.

def isSubtree(t1, t2)
    return true if identify(t1, t2) || t2.nil?
    return false if t1.nil?
    return true if isSubtree(t1.left, t2)
    return true if isSubtree(t1.right, t2)
    false
end

def identify(t1, t2)
    return true if t1.nil? && t2.nil?
    return false if t1.nil? ^ t2.nil?
    return (t1.value == t2.value and identify(t1.left,t2.left) and identify(t1.right,t2.right))
end