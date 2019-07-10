# The inversion count for an array indicates how far the array is from being sorted. If the array is already sorted, then the inversion count is 0. If the array is sorted in reverse order, then the inversion count is the maximum possible value.

# Given an array a, find its inversion count. Since this number could be quite large, take it modulo 109 + 7.

# Example

# For a = [3, 1, 5, 6, 4], the output should be countInversions(a) = 3.

# The three inversions in this case are: (3, 1), (5, 4), (6, 4).

#O(n log n) using merge_sort
def countInversions(a) 
    def merge arr,*new  
        return [0,arr] if arr.size == 1
        inv_merge = i = j = 0 
        inv_left, left = merge(arr[0...mid = arr.size / 2]) 
        inv_right, right = merge(arr[mid..-1]) 
        while i < mid && j < right.size 
            if right[j] < left[i] 
                inv_merge += mid - i 
                new << right[j] 
                j += 1 
            else 
                new << left[i] 
                i += 1 
            end 
        end 
        [inv_left + inv_merge + inv_right, new + (i < mid ? left[i..-1] : right[j..-1]) ]
    end 
    merge(a)[0] % (10 ** 9 + 7)
end

