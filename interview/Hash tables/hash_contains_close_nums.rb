# Given an array of integers nums and an integer k, 
# determine whether there are two distinct indices i and j in the array where 
# nums[i] = nums[j] and the absolute difference between i and j is less than or equal to k.

# Example
# For nums = [0, 1, 2, 3, 5, 2] and k = 3, the output should be
# containsCloseNums(nums, k) = true.

# There are two 2s in nums, and the absolute difference between their positions is exactly 3.

# For nums = [0, 1, 2, 3, 5, 2] and k = 2, the output should be
# containsCloseNums(nums, k) = false.

# The absolute difference between the positions of the two 2s is 3, which is more than k.

# Input/Output
# [execution time limit] 4 seconds (rb)
# [input] array.integer nums

# Guaranteed constraints:
# 0 ≤ nums.length ≤ 55000,
# -231 - 1 ≤ nums[i] ≤ 231 - 1.

# [input] integer k

# Guaranteed constraints:
# 0 ≤ k ≤ 35000.

# [output] boolean

def containsCloseNums(nums, k)       
    hash = Hash.new 0
    nums.each_with_index { |x, i|
        j = i - k - 1
        if j >= 0
            hash[nums[j]] -= 1
        end
        return true if hash[x] > 0
        hash[x] += 1
    }
    false
end