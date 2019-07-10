# The city ordinance in BoxCity requires that all buildings be rectangles that lie flat along the ground. All the information about a particular building is contained in 3 numbers:

# left: the x coordinate of the left side of the building,
# width: the width of the building,
# height: the height of the building.
# The image below shows a building with (left, width, height) = (2,3,6).
# Building

# The skyline is a list of adjacent rectangular strips, and represents the collective outline of all the buildings in BoxCity.

# Each strip is represented as (left, height) as defined above. We don't need the width of the strip, as this is determined by the left side of the next strip. At the right edge of the city, there will be an infinitely small strip (x, 0). Strips should be the minimum height possible.

# Given the list of buildings buildings, where each building is represented by an array of three elements [left, width, height], return the skyline as a list of strips, where each strip is represented by an array of two elements [left, height].

# Example

# For buildings = [[2, 3, 6]], the output should be
# getSkyline(buildings) = [[2, 6], [5, 0]].

# Example 1

# For buildings = [[2, 3, 6], [3, 4, 6]], the output should be
# getSkyline(buildings) = [[2, 6], [7, 0]].

# Example 2

# For buildings = [[1, 4, 4], [2, 5, 3], [3, 3, 6], [5.5, 3, 5], [10, 2, 2], [11, 2, 3]], the output should be
# getSkyline(buildings) = [[1, 4], [3, 6], [6, 5], [8.5, 0], [10, 2], [11, 3], [13, 0]].

# Example 3
def getSkyline buildings  
    availableHeights = {}
    changePoints = {}
    skyline = []
    
    id = 0
    buildings.map{|s,l,h|
        id += 1
        
        changePoints[s] ||= []
        changePoints[s+l] ||= []
        
        changePoints[s] << ["start",id,h]
        changePoints[s+l] << ["end",id,h]
    }

    currentMax = 0
    
    changePoints.sort.each{|pos,vals|
        newMax = currentMax
        vals.each{ |type,id,h|
            (
                availableHeights[id] = h    
                newMax = h if h > newMax
            )   if type=="start"
            
            (
                del = availableHeights.delete(id)
                newMax = availableHeights.values.max || 0 if del == newMax
            )  if type=="end"
        }
        
        skyline << [pos,newMax] if newMax != currentMax
        currentMax = newMax
    }
    
    skyline
end