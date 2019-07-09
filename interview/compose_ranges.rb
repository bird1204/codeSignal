# Given a sorted integer array that does not contain any duplicates, return a summary of the number ranges it contains.

# Example

# For nums = [-1, 0, 1, 2, 6, 7, 9], the output should be
# composeRanges(nums) = ["-1->2", "6->7", "9"].
def composeRanges(nums)
  return [] if nums.empty?
  ranges = []
  ranges << [nums.first]
  i = 1
  while i < nums.length
    if nums[i] - nums[i-1] == 1
      ranges.last << nums[i]
    else
      ranges << [nums[i]]
    end
    i += 1
  end
  ranges.map do |range|
    if range.length == 1
      range.first.to_s
    else
      "#{range.first}->#{range.last}"
    end
  end
end

