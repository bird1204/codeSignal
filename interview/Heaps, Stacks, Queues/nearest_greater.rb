# Given an array of integers a, return a new array b using the following guidelines:

# For each index i in b, the value of bi is the index of the aj nearest to ai and is also greater than ai.
# If there are two options for bi, put the leftmost one in bi.
# If there are no options for bi, put -1 in bi.
# Example

# For a = [1, 4, 2, 1, 7, 6], the output should be
# nearestGreater(a) = [1, 4, 1, 2, -1, 4].

# for a[0], the nearest larger element is 4 at index a[1] -> b[0] contains the value 1.
# for a[1], the nearest larger element is 7 at a[4] -> b[1] contains the value 4.
# for a[2], the nearest larger element is 4 at a[1] (7 is also larger, but 4 has the minimal position) -> b[2] contains the value 1.
# for a[3], the nearest larger element is 2 at a[2] (7 is also larger, but 2 has the minimal position) -> b[3] contains the value 2.
# for a[4], there is no element larger than 7 -> b[4] contains the value -1.
# for a[5], the nearest larger element is 7 at a[4] -> b[5] contains the value 4.
def nearestGreater(a)
    
    result = []
    stack = []
  
    a.each_with_index do |el, i|
       
        while !stack.empty? and a[stack[-1]] < el
            num = stack.pop
            if result[num] == -1 || (i - num < num - result[num])
                result[num] = i
            end
        end
        
        if stack.empty?
            result[i] = -1 
        else
            if el != a[stack[-1]]
                result[i] = stack[-1]
            else
                result[i] = result[stack[-1]]
            end
        end
        stack << i
    end
    
    result
end


