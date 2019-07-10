# As a director of a large company, you try to do your best to make the working environment as efficient as possible. However, it's difficult to do so when even the hardware used in the office is not efficient: there are too many wires connecting your employees' computers.

# Naturally, you decided to minimize their number by getting rid of some wires. There's only one constraint: if it is possible to deliver information from one computer to another one using the wires, it should still be possible to do so after the renovation. You would also like to minimize the total wires length, because the longer the wires, the more it possible for you to trip over them at some point.

# Given the plan of your n office computers and the wires connecting them, find the minimum resulting length of the wires after removing some of them according to the constraints above.
def networkWires(n, wires)
    sorted = wires.sort{|a,b| a[2] <=> b[2]}
    graph = (0..n-1).to_a
    sum = 0 
    sorted.each do |edge|
        # p graph
        if verticesNotConnected(edge, graph)
            #   add to graph, now how do I add to the graph? 
            #   build a literal graph using an adjaceny matrix or list?
            #       Just add to the adjanceny matrix and search it using a DFS starting until all searched, 
            #       
            #   Do this union find kind of thing with an array?
            #       Just need to keep a record of things being connected with know the details of the
            #       connection (this is a trade off)
            #       The key to the union find idea is that the graph data structure stores information about connectivity but not the details of the connections. The trade-off is information for speed. 
            graph = graph.map{|val| val == graph[edge[0]] ? graph[edge[1]] : val }   
            sum += edge[2]
        end
    end    
    sum
end 

def verticesNotConnected(edge, graph)
    graph[edge[0]] != graph[edge[1]] 
end 