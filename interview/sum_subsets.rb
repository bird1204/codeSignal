# Given a sorted array of integers arr and an integer num, find all possible unique subsets of arr that add up to num. Both the array of subsets and the subsets themselves should be sorted in lexicographical order.

# Example

# For arr = [1, 2, 3, 4, 5] and num = 5, the output should be
# sumSubsets(arr, num) = [[1, 4], [2, 3], [5]].
def sumSubsets(arr, num)
  combo = []
  results = []
  cached_results = {}
  findSumSubsets(arr, num, combo, results, cached_results)
  results.map {|r| r.sort}.uniq
end

def findSumSubsets(arr, num, combo, results, cached_results)
  cached_results[combo.sort] = num
  results << combo if num == 0
  arr.each_with_index do |ele, i|
    if num - ele >= 0
      findSumSubsets(arr[0...i] + arr[i+1..-1], num - ele, combo + [ele], results, cached_results) if cached_results[(combo + [ele]).sort] != num - ele
    end
  end
end


