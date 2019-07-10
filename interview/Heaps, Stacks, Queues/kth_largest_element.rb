# Note: Avoid using built-in std::nth_element (or analogous built-in functions in languages other than C++) when solving this challenge. Implement them yourself, since this is what you would be asked to do during a real interview.

# Find the kth largest element in an unsorted array. This will be the kth largest element in sorted order, not the kth distinct element.

# Example

# For nums = [7, 6, 5, 4, 3, 2, 1] and k = 2, the output should be
# kthLargestElement(nums, k) = 6;
# For nums = [99, 99] and k = 1, the output should be
# kthLargestElement(nums, k) = 99.
def kthLargestElement(nums, k)
    nums.sort[nums.length - k]
end

# method 2
# def kthLargestElement(nums, k)
#     raise if nums.empty?
#     return nums[0] if nums.size == 1
#     nums.shuffle!
#     partition = nums[0]
#     upper = nums[1..-1].select { |x| x >= partition }
#     if upper.size >= k
#         kthLargestElement(upper, k)
#     else
#         lower = nums[1..-1].select { |x| x < partition }
#         lower << partition
#         kthLargestElement(lower, k - upper.size)
#     end
# end

