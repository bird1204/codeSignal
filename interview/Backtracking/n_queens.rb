# In chess, queens can move any number of squares vertically, horizontally, or diagonally. The n-queens puzzle is the problem of placing n queens on an n × n chessboard so that no two queens can attack each other.

# Given an integer n, print all possible distinct solutions to the n-queens puzzle. Each solution contains distinct board configurations of the placement of the n queens, where the solutions are arrays that contain permutations of [1, 2, 3, .. n]. The number in the ith position of the results array indicates that the ith column queen is placed in the row with that number. In your solution, the board configurations should be returned in lexicographical order.

# Example

# For n = 1, the output should be
# nQueens(n) = [[1]];

# For n = 4, the output should be

#   nQueens(n) = [[2, 4, 1, 3],
#                 [3, 1, 4, 2]]
# This diagram of the second permutation, [3, 1, 4, 2], will help you visualize its configuration:



# The element in the 1st position of the array, 3, indicates that the queen for column 1 is placed in row 3. Since the element in the 2nd position of the array is 1, the queen for column 2 is placed in row 1. The element in the 3rd position of the array is 4, meaning that the queen for column 3 is placed in row 4, and the element in the 4th position of the array is 2, meaning that the queen for column 4 is placed in row 2.
def nQueens(n, state=[])
    return [state] if state.size == n
    
    result = []
    
    (1..n).each do |i|
        next if invalid(state, i)
        
        nQueens(n, state + [i]).each do |sub_state|
            result << sub_state
        end
    end
    
    result
end

def invalid(state, row2)
    return false if state.empty?
    return true  if state.include?(row2)
    
    col2       = state.size + 1
    is_invalid = false
    
    state.each_with_index do |row1, idx|
        col1 = idx + 1
        if (col1 - col2).abs == (row1 - row2).abs
            is_invalid = true
            break
        end
    end
    
    is_invalid
end


