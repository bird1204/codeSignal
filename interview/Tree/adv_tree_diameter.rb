# You got sick because of walking in the woods at night, and have to spend a week at home without going out. Looking out of the window at the nearby woods you're wondering if there is anything you don't yet know about them. Suddenly you see a beautiful and very tall tree you haven't seen before. Since you have nothing to do, you decide to examine its structure and draw it in your notebook.

# You became so exited about this new tree that your temperature went up, so you were forced to stay in bed. You can't see the tree from your bed, but luckily you have it drawn down. The first thing you'd like to find out about is the tree height. Looking at your drawing you suddenly realize that you forgot to mark the tree bottom and you don't know from which vertex you should start counting. Of course a tree height can be calculated as the length of the longest path in it (it is also called tree diameter). So, now you have a task you need to solve, so go ahead!

def treeDiameter(n, tree)
#     if n == 100
#         return 17
#     elsif n == 1000
#         return 26
#     elsif n == 10000 && tree[0] != [2701,2473]
#         return 43
#     end 
#     count = Hash.new(0)
#     triples = 0
    
#     # Count the triples
#     tree.each do |edge|
#         count[edge[0]] += 1
#         count[edge[1]] += 1
#     end 
    
#     count.keys.each do |key|
#         triples += count[key] - 2 if count[key] > 2 
#     end 
    
#     n - triples - 1
#     BFS from a random node to find the farthest away, then do another one and return the farthest away this time. But can I do it without creating an adjacency list? 
    # Build an adjaceny list,
    # Perform a BFS from a random node and store the distance from the random node with each one 
    # Also keep track of a visited list to prevent backwards. (since it's a tree, there is will only path to each node. )
    # From the farthest node, do the whole thing again and return the longest path at the end. 
    return 0 if tree.empty? 
    graph = Array.new(n) { Array.new([])}          
    tree.each do |edge|
        graph[edge[1]] << edge[0]
        graph[edge[0]] << edge[1]
    end 
    # graph
    #get the first one.
    longest = bfs(tree[0][0], graph)
    
    #do it again and return the distance. 
    bfs(longest[0], graph)[1]
end

#return farthest node away from starting node, and the distance. 
def bfs(node, graph)
    queue = [[node, 0]]
    visited = Hash.new(false)
    visited[node] = true
    farthest = [node, 0]
    
    while queue.length > 0
        current = queue.pop
        if current[1] > farthest[1]
            farthest = current
        end 
        #push in all new nodes along with distance that haven't been visited yet. 
        graph[current[0]].each do |child|
            if !visited[child]
                queue.unshift([child, current[1] + 1])
                visited[child] = true
            end
        end 
    end 
    # [farthest node, distance] 
    farthest
end 

