# You are climbing a staircase that has n steps. 
# You can take the steps either 1 or 2 at a time. 
# Calculate how many distinct ways you can climb to the top of the staircase.

# Example

# For n = 1, the output should be
# climbingStairs(n) = 1;

# For n = 2, the output should be
# climbingStairs(n) = 2.

# You can either climb 2 steps at once or climb 1 step two times.
def climbingStairs(n)
    arr = []
    arr << 1
    for i in 1 ... n
        arr << arr[i-1]+arr[i-2]
    end
    return arr[n-1]
end

