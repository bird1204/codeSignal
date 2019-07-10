# Implement the missing code, denoted by ellipses. You may not modify the pre-existing code.
# Given K sorted arrays, return their sorted concatenation.
def mergeKArrays(arrays)
  firstUnused = Array.new
  result = Array.new
  n = 0
  for i in 0..(arrays.length - 1) do
    firstUnused.push(0)
    n += arrays[i].length
  end
  for i in 0..(n - 1) do
    minIndex = -1
    minValue = 0
    for j in 0..(arrays.length - 1) do
      if firstUnused[j] < arrays[j].length
        # recovering here
        if minIndex == -1 or minValue > arrays[j][firstUnused[j]]
          minIndex = j
          minValue = arrays[j][firstUnused[j]]
        end
      end
    end
    result.push(minValue)
    firstUnused[minIndex] += 1
  end
  return result
end

