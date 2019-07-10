# You have a 2D binary matrix that's filled with 0s and 1s. In the matrix, find the largest square that contains only 1s and return its area.

# Example

# For

# matrix = [
#     ['1', '0', '1', '1', '1'],
#     ['1', '0', '1', '1', '1'],
#     ['1', '1', '1', '1', '1'],
#     ['1', '0', '0', '1', '0'],
#     ['1', '0', '0', '1', '0']
# ]
# the output should be
# maximalSquare(matrix) = 9.

def maximalSquare(matrix)
    matrix = matrix.map {|col|col.map(&:to_i).dup}
    matrix.each_with_index do |col,ci|
        next if ci == 0
        col.each_with_index do |row, ri|
            next if row == 0 || ri == 0
            v = [matrix[ci-1][ri-1], matrix[ci][ri-1], matrix[ci-1][ri]].min + 1
            matrix[ci][ri] = v
        end
    end
    (matrix.flatten.max || 0)** 2
end