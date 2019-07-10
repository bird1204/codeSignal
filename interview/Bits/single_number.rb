# Implement the missing code, denoted by ellipses. You may not modify the pre-existing code.
# You are given an array of integers in which every element appears twice, except for one. Find the element that only appears one time. Your solution should have a linear runtime complexity (O(n)). Try to implement it without using extra memory.

# Example

# For nums = [2, 2, 1], the output should be
# singleNumber(nums) = 1.
def singleNumber(nums)
    res = 0
    for num in nums
        res = num if nums.count{|n| n == num} == 1
    end
    return res
end

# method 2
# def singleNumber(nums)
#     res = 0
#     for num in nums
#         res ^= num
#     end
#     return res
# end

