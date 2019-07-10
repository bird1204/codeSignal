# Note: Try to solve this task in O(n) time using O(1) additional space, 
# where n is the number of elements in l, 
# since this is what you'll be asked to do during an interview.

# Given a singly linked list of integers, determine whether or not it's a palindrome.

# Note: in examples below and tests preview linked lists are presented as arrays 
# just for simplicity of visualization: in real data you will be given a head node l of the linked list

# Example
# For l = [0, 1, 0], the output should be
# isListPalindrome(l) = true;

# For l = [1, 2, 2, 3], the output should be
# isListPalindrome(l) = false.


# Singly-linked lists are already defined with this interface:
# class ListNode
#   attr_accessor :value, :next
#   def initialize(val)
#     @value = val
#     @next = nil
# end
#
def isListPalindrome(l)
    array = Array.new
    while l
        array << l.value
        l = l.next
    end
    center_idx = (array.size / 2.0).ceil - 1
    if array.size.odd?
        return true if array.size == 1
        return array[0..center_idx - 1].reverse == array[center_idx + 1..array.size - 1]
    else
        return array[0..center_idx].reverse == array[center_idx + 1..array.size - 1]
    end
end

