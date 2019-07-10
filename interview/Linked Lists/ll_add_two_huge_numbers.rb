# You're given 2 huge integers represented by linked lists. 
# Each linked list element is a number from 0 to 9999 that represents a number with exactly 4 digits. 
# The represented number might have leading zeros. 
# Your task is to add up these huge integers and return the result in the same format.

# Example
# For a = [9876, 5432, 1999] and b = [1, 8001], the output should be
# addTwoHugeNumbers(a, b) = [9876, 5434, 0].
# Explanation: 987654321999 + 18001 = 987654340000.

# For a = [123, 4, 5] and b = [100, 100, 100], the output should be
# addTwoHugeNumbers(a, b) = [223, 104, 105].
# Explanation: 12300040005 + 10001000100 = 22301040105.

# Input/Output
# [execution time limit] 4 seconds (rb)
# [input] linkedlist.integer a
# The first number, without its leading zeros.

# Guaranteed constraints:
# 0 ≤ a size ≤ 104,
# 0 ≤ element value ≤ 9999.

# [input] linkedlist.integer b
# The second number, without its leading zeros.

# Guaranteed constraints:
# 0 ≤ b size ≤ 104,
# 0 ≤ element value ≤ 9999.

# [output] linkedlist.integer

# The result of adding a and b together, returned without leading zeros in the same format.

# Singly-linked lists are already defined with this interface:
# class ListNode
#   attr_accessor :value, :next
#   def initialize(val)
#     @value = val
#     @next = nil
# end

def addTwoHugeNumbers(a, b)
    a_str = add_pad(a)
    b_str = add_pad(b)
    sum_str = (a_str.to_i + b_str.to_i).to_s
    sum_str = sum_str.rjust(sum_str.size + (4 - (sum_str.size % 4)), '0') if (sum_str.size % 4 > 0)
    sum_str.scan(/.{4}/).map(&:to_i)
end

def add_pad(node)
    str = ""
    n = node
    while !n.nil? do
      str << n.value.to_s.rjust(4,'0')
      n = n.next
    end
    str
end