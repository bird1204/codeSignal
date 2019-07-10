# Given a sequence of numbers in an array, find the length of its longest increasing subsequence (LIS).
# The longest increasing subsequence is a subsequence of a given sequence in which the subsequence's elements are in strictly increasing order, and in which the subsequence is as long as possible. This subsequence is not necessarily contiguous or unique.

# Example

# For sequence = [1, 231, 2, 4, 89, 32, 12, 234, 33, 90, 34, 100], the output should be
# longestIncreasingSubsequence(sequence) = 7.

# The LIS itself is [1, 2, 4, 32, 33, 34, 100].
def longestIncreasingSubsequence(sequence)
    depth = Array.new(sequence.length)
    (0..sequence.length-1).each { |i|
        num = sequence[i]
        maxDepth = 0
        if i>0
            (0..i-1).each { |j|
                maxDepth = depth[j] if sequence[j]<num && depth[j]>maxDepth
            }
        end
        depth[i] = maxDepth + 1
    }
    depth.max
end