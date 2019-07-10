# Given an array of integers, find the maximum possible sum you can get from one of its contiguous subarrays. The subarray from which this sum comes must contain at least 1 element.

# Example

# For inputArray = [-2, 2, 5, -11, 6], the output should be
# arrayMaxConsecutiveSum2(inputArray) = 7.

# The contiguous subarray that gives the maximum possible sum is [2, 5], with a sum of 7.

def arrayMaxConsecutiveSum2(inputArray)
  current_sum = max_sum = inputArray[0]
  inputArray[1..-1].each do |num|
    current_sum = [num, current_sum + num].max
    max_sum = [max_sum, current_sum].max
  end
  max_sum
end

