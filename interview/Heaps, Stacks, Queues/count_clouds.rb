# Given a 2D grid skyMap composed of '1's (clouds) and '0's (clear sky), count the number of clouds. A cloud is surrounded by clear sky, and is formed by connecting adjacent clouds horizontally or vertically. You can assume that all four edges of the skyMap are surrounded by clear sky.

# Example

# For

# skyMap = [['0', '1', '1', '0', '1'],
#           ['0', '1', '1', '1', '1'],
#           ['0', '0', '0', '0', '1'],
#           ['1', '0', '0', '1', '1']]
# the output should be
# countClouds(skyMap) = 2;

# For

# skyMap = [['0', '1', '0', '0', '1'],
#           ['1', '1', '0', '0', '0'],
#           ['0', '0', '1', '0', '1'],
#           ['0', '0', '1', '1', '0'],
#           ['1', '0', '1', '1', '0']]
# the output should be
# countClouds(skyMap) = 5.
def countClouds(skyMap)
    clouds = 0
    0.upto(skyMap.length-1).each do |i|
        0.upto(skyMap[i].length-1).each do |j|
            if skyMap[i][j] == '1'
                clouds += 1
                visit(i,j,skyMap)
                skyMap[i][j] = '0'
            end
        end
    end
    clouds
end

def visit(i, j, skyMap)
    if j < skyMap[0].length-1
        if skyMap[i][j+1] == "1"
            skyMap[i][j+1]="0"
            visit(i,j+1,skyMap)
        end
    end
    if j>0
        if skyMap[i][j-1] == "1"
            skyMap[i][j-1]="0"
            visit(i,j-1,skyMap)
        end
    end
    if i<skyMap.length-1
        if skyMap[i+1][j] == "1"
            skyMap[i+1][j]="0"
            visit(i+1,j,skyMap)
        end
    end
    if i>0
        if skyMap[i-1][j] == "1"
            skyMap[i-1][j]="0"
            visit(i-1,j,skyMap)    
        end
    end

end