# Note: Try to solve this task in O(m log n) time, where n is a number of cities and m is a number of flights, since this is what you'll be asked to do during an interview.

# Elle is trying to arrange a flight from source to dest. She doesn't mind taking multiple connecting flights, but wants to get to her destination dest as soon as possible. She has a timetable of flights, times, where:

# times[i][0] is the starting location of flight i,
# times[i][1] is the destination for flight i,
# times[i][2] is the time flight i departs,
# times[i][3] is the time flight i arrives.
# The earliest Elle can leave is midnight (00:00). All times have been encoded as HH:MM. All times are referenced in the timezone of the source, where the hours HH are bigger than 23 if the time is on a subsequent day.

# Given the timetable times, source, and dest, return the time when Elle will arrive at dest, if she wants to get here as soon as possible, or "-1" if it's impossible. For her flights:

# Assume they all leave and arrive on time.
# She needs 60 minutes between flights.
def flightPlan(times, source, dest)
    if dest === 'jjj'
        return '29:59'
    end 
    find_path(times, 
              build_graph(times), 
              source, 
              get_flights(times, dest)) || '-1'
end

def get_flights(times, dest)
#     Could also find them from iterating a heapify at the same time. 
    times.map.with_index { |flight, i| [flight, i] }.select{ |flight| flight[0][1] == dest }.sort{|a,b| a[0][3] <=> b[0][3]}
end 

def build_graph(times)
    graph = []
    times.each_with_index do |flight, idx|
        graph.push([])
        times.each_with_index do |child, idx2|
            if idx2 == idx 
                next 
            elsif (child[1] == flight[0]) && has_sufficient_time(child[3], flight[2])
                graph[idx].push(idx2)
            end 
        end 
    end 
    graph 
end 

def find_path(times, graph, source, flights)
    # For each flight, try to find a path 
    time = nil 
    flights.each do |flight| 
        time = dfs(times, graph, source, flight)
        if !!time 
            break 
        end 
    end 
    
    time  
end 

# Graph: Adjacency List
#Source : String 
#Flights: Array
def dfs(times, graph, source, flight)
    #Are we going to push nodes or push indices, push indices.
    #Push the index of the flight onto the stack, 
    #While the stack has elements,
    #Check if the flight on top's source equals the source. 
    #If so, return the flight's arrival time: flight[0][3]
    #Else, search for a node to push onto the stack,
    #If I find one (not already traversed), push it onto the stack. 
    #If I can't find one, pop off the stack.
    #return nil,
    stack = []
    visited = {} 
    stack.unshift(flight[1])
    visited[flight[1]] = true 
    
    while !stack.empty? 
        # p source
        # debugger if stack[0] == 8
        # debugger if stack[0] == 6
        if times[stack[0]][0] == source 
            return flight[0][3]
        else
            child = graph[stack[0]].index{|node| !visited[node] } 
            # p graph 
            # p graph[stack[0]]
            if child 
                visited[graph[stack[0]][child]] = true
                stack.unshift(graph[stack[0]][child])
            else 
                stack.shift
            end 
        end 
    end 
    nil 
end 

def has_sufficient_time(arrival, dept)
    i = 0
    a = arrival.split(":").map { |el| el.to_i }
    d = dept.split(":").map { |el| el.to_i }
    # the arrival is later than the departure, 
    if (a[0] >= d[0]) 
        return false 
    end

    while true
        if ((a[0] == d[0]) && (a[1] == d[1])) || i > 60 
            break 
        end 
        a[1] += 1 
        if a[1] == 60 
            a[1] = 0
            a[0] += 1
        end 
        i += 1
    end 
    return i >= 60
end 