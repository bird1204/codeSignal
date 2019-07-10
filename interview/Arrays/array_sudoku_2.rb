# Sudoku is a number-placement puzzle. 
# The objective is to fill a 9 × 9 grid with numbers in such a way that each column, 
# each row, and each of the nine 3 × 3 sub-grids that compose the grid all contain all of the numbers from 1 to 9 one time.

# Implement an algorithm that will check whether the given grid of numbers 
# represents a valid Sudoku puzzle according to the layout rules described above. 
# Note that the puzzle represented by grid does not have to be solvable.

# Example
# For
# grid = [['.', '.', '.', '1', '4', '.', '.', '2', '.'],
#         ['.', '.', '6', '.', '.', '.', '.', '.', '.'],
#         ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
#         ['.', '.', '1', '.', '.', '.', '.', '.', '.'],
#         ['.', '6', '7', '.', '.', '.', '.', '.', '9'],
#         ['.', '.', '.', '.', '.', '.', '8', '1', '.'],
#         ['.', '3', '.', '.', '.', '.', '.', '.', '6'],
#         ['.', '.', '.', '.', '.', '7', '.', '.', '.'],
#         ['.', '.', '.', '5', '.', '.', '.', '7', '.']]
# the output should be
# sudoku2(grid) = true;

# For
# grid = [['.', '.', '.', '.', '2', '.', '.', '9', '.'],
#         ['.', '.', '.', '.', '6', '.', '.', '.', '.'],
#         ['7', '1', '.', '.', '7', '5', '.', '.', '.'],
#         ['.', '7', '.', '.', '.', '.', '.', '.', '.'],
#         ['.', '.', '.', '.', '8', '3', '.', '.', '.'],
#         ['.', '.', '8', '.', '.', '7', '.', '6', '.'],
#         ['.', '.', '.', '.', '.', '2', '.', '.', '.'],
#         ['.', '1', '.', '2', '.', '.', '.', '.', '.'],
#         ['.', '2', '.', '.', '3', '.', '.', '.', '.']]
# the output should be
# sudoku2(grid) = false.

# The given grid is not correct because there are two 1s in the second column. Each column, each row, and each 3 × 3 subgrid can only contain the numbers 1 through 9 one time.

# Input/Output
# [execution time limit] 4 seconds (rb)
# [input] array.array.char grid
# A 9 × 9 array of characters, in which each character is either a digit from '1' to '9' or a period '.'.

# [output] boolean
# Return true if grid represents a valid Sudoku puzzle, otherwise return false.

def sudoku2(grid)
    grid.each do |row|
        return false unless valid?(row)
    end

    (0..8).each do |i|
        column = grid.map { |row| row[i] }
        return false unless valid?(column)
    end
    
    (0..8).step(3).each do |i|
        (0..8).step(3).each do |j|
            subgrid = []
            subgrid << grid[i][j]
            subgrid << grid[i][j+1]
            subgrid << grid[i][j+2]
            subgrid << grid[i+1][j]
            subgrid << grid[i+1][j+1]
            subgrid << grid[i+1][j+2]
            subgrid << grid[i+2][j]
            subgrid << grid[i+2][j+1]
            subgrid << grid[i+2][j+2]
            return false unless valid?(subgrid)
        end
    end
    
    true
end

def valid?(array)
    nums = array.select { |n| n.match(/\d/) }
    nums.uniq.length == nums.length
end