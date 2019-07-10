# Note: Come up with a linear solution, since that is what you would be asked to do in an interview.

# You have a sorted array of integers. Write a function that returns a sorted array containing the squares of those integers.

# Example

# For array = [-6, -4, 1, 2, 3, 5], the output should be
# sortedSquaredArray(array) = [1, 4, 9, 16, 25, 36].

# The array of squared integers from array is: [36, 16, 1, 4, 9, 25]. When sorted, it becomes: [1, 4, 9, 16, 25, 36].

def sortedSquaredArray(a)
    i=0
    j=a.size - 1
    r=[]
    while i < j 
        x=a[i]**2
        y=a[j]**2
        if x == y 
            r.unshift(x)
            r.unshift(y) 
            i+=1
            j-=1
        elsif x > y 
            r.unshift(x)
            i+=1
        else
            r.unshift(y)
            j-=1
        end
    end
    r.unshift(a[i]**2) if i==j
    r
end