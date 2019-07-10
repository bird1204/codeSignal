# Given a binary tree t, 
# determine whether it is symmetric around its center, i.e. each side mirrors the other.

def isTreeSymmetric(t)
    return true if t.nil?
    compare(t.left, t.right)
end

def compare(a, b)
    return true if a.nil? and b.nil?
    return false if a.nil? or b.nil?
    (a.value == b.value and compare(a.left, b.right) and compare(a.right, b.left))
end