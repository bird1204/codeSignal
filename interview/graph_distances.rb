# You have a strongly connected directed graph that has positive weights in the adjacency matrix g. The graph is represented as a square matrix, where g[i][j] is the weight of the edge (i, j), or -1 if there is no such edge.

# Given g and the index of a start vertex s, find the minimal distances between the start vertex s and each of the vertices of the graph.

# Example

# For

# g = [[-1, 3, 2],
#      [2, -1, 0],
#      [-1, 0, -1]]
# and s = 0, the output should be
# graphDistances(g, s) = [0, 2, 2].

# Example

# The distance from the start vertex 0 to itself is 0.
# The distance from the start vertex 0 to vertex 1 is 2 + 0 = 2.
# The distance from the start vertex 0 to vertex 2 is 2.
require 'bigdecimal'

def graphDistances(graph, source)  
  unvisited = (0...graph.size).to_a
  min_distance = Array.new(unvisited.count, BigDecimal('Infinity'))
  min_distance[source] = 0  
  
  while unvisited.any?
    current = unvisited.min { |a, b| min_distance[a] <=> min_distance[b] }
    unvisited.reject! { |u| u == current }    
    
    current_neighbors = unvisited.reject { |v| graph[current][v] == -1 }
    current_neighbors.each do |neighbor|
      alt_distance = min_distance[current] + graph[current][neighbor]
      if alt_distance < min_distance[neighbor]
        min_distance[neighbor] = alt_distance
      end
    end
  end
  
  min_distance
end


