# You have array of integers nums and you need to build a new counts array. In the new counts array, counts[i] is the number of smaller elements to the right of nums[i]. You're asked to find not the counts array, but the sum of its elements.

# Example

# For nums = [3, 8, 4, 1], the output should be
# countSmallerToTheRight(nums) = 4.

# To the right of 3: there is 1 smaller element (1).
# To the right of 8: there are 2 smaller elements (4 and 1).
# To the right of 4: there is 1 smaller element (1).
# To the right of 1: there are 0 smaller elements.
# The resulting array is [1, 2, 1, 0], and the sum of its elements is 1 + 2 + 1 + 0 = 4.
def countSmallerToTheRight(nums)
    sorted=[]
   
    nums.size.times.sum{
        cur = nums.pop
        i=sorted.bsearch_index{|n| n >= cur } || sorted.size
        sorted.insert(i,cur)
        i
    }
end