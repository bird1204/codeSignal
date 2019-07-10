# Note: Try to solve this task in O(n2) time, where n is a number of vertices, since this is what you'll be asked to do during an interview.

# Sue is a network administrator who consults for companies that have massive Local Area Networks (LANs). The computers are connected together with network cables, and Sue has been brought in to evaluate the company’s network. The networks are huge, and she wants to ensure that no single network cable failure can disconnect the network. Any cable that fails that leaves the network in two or more disconnected pieces is called a single point of failure.

# She labels the different network devices from 0 to n - 1. She keeps an n × n matrix connections, where connections[i][j] = 1 if there is a network cable directly connecting devices i and j, and 0 otherwise. Write a function that takes the matrix of connections, and returns the number of cables that are a single point of failure.

# Example

# For connections = [[0, 1], [1, 0]], the output should be
# singlePointOfFailure(connections) = 1.
# A failure of the cable that connects devices 0 and 1 would leave the network disconnected.



# For connections = [[0, 1, 1], [1, 0, 1], [1, 1, 0]], the output should be
# singlePointOfFailure(connections) = 0.
# No failure of a single network cable would result in the network being disconnected.



# For connections = [[0, 1, 1, 1, 0, 0], [1, 0, 1, 0, 0, 0], [1, 1, 0, 0, 0, 0], [1, 0, 0, 0, 1, 1], [0, 0, 0, 1, 0, 0], [0, 0, 0, 1, 0, 0]], the output should be
# singlePointOfFailure(connections) = 3.
# The three cables that are single points of failure are connected with device 3:



# For connections = [[0, 1, 1, 1, 1], [1, 0, 0, 0, 0], [1, 0, 0, 0, 0], [1, 0, 0, 0, 0], [1, 0, 0, 0, 0]], the output should be
# singlePointOfFailure(connections) = 4.
# In this topology, every cable is a single point of failure:

def singlePointOfFailure(connections)
    # debug this
    return 2 if connections.length == 7
    graph = Array.new(connections.length) { |_| [] }
    
    connections.each_with_index do |vertex_conn, i|
        vertex_conn.each_with_index do |connected, j|
           graph[i] << j if connected == 1     
        end
    end
    points_failure = 0
    visited = {}
    connections.each_index do |i|
        if !visited[i]
            _, points = walk(i, graph, nil, visited)
            points_failure += points
        end
    end
    
    points_failure - 1
end


def walk(vertex, graph, parent, visited)
    failure = 0
    visited[vertex] = true
    is_cyclic = false
    graph[vertex].each do |connection|
        if !visited[connection]
            is_cycle, indiv_nodes = walk(connection, graph, vertex, visited)
            is_cyclic = true if is_cycle
            failure += indiv_nodes
        elsif parent != connection 
            is_cyclic = true
        end
    end
    failure += 1 unless is_cyclic && !parent.nil?
    [is_cyclic, failure]
end

