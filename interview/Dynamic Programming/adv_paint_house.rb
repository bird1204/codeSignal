# In San Francisco, there is a row of several beautiful houses called the Painted Ladies. Each of the Painted Ladies can be painted with one of three colors: red, blue or green. The cost of painting each house with a certain color is different. cost[i][0] for each i is the cost of painting house i red, cost[i][1] is the cost of painting it blue, and cost[i][2] is the cost of painting it green.

# You want to paint all the houses in a way such that no two adjacent Painted Ladies have the same color. Find the minimum cost to achieve this.

# Example

# For cost = [[1, 3, 4], [2, 3, 3], [3, 1, 4]], the output should be
# paintHouses(cost) = 5.

# You can paint the first Painted Lady red for a cost of 1, the second one green for a cost of 3, and the third one blue for a cost of 1, for a total cost of 5.

def paintHouses(homes)
    cost = homes[0].dup
    
    homes[1..-1].each do |h|
        new_cost = [0] * 3
        
        new_cost[0] = h[0] + [cost[1], cost[2]].min
        new_cost[1] = h[1] + [cost[0], cost[2]].min
        new_cost[2] = h[2] + [cost[0], cost[1]].min
        
        cost = new_cost
    end
    
    cost.min
end