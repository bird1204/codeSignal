# Given a string str and array of pairs that indicates which indices in the string can be swapped, 
# return the lexicographically largest string that results from doing the allowed swaps. 
# You can swap indices any number of times.

# Example

# For str = "abdc" and pairs = [[1, 4], [3, 4]], the output should be
# swapLexOrder(str, pairs) = "dbca".

# By swapping the given indices, you get the strings: "cbda", "cbad", "dbac", "dbca". The lexicographically largest string in this list is "dbca".

# Input/Output

# [execution time limit] 4 seconds (rb)

# [input] string str

# A string consisting only of lowercase English letters.

# Guaranteed constraints:
# 1 ≤ str.length ≤ 104.

# [input] array.array.integer pairs

# An array containing pairs of indices that can be swapped in str (1-based). This means that for each pairs[i], you can swap elements in str that have the indices pairs[i][0] and pairs[i][1].

# Guaranteed constraints:
# 0 ≤ pairs.length ≤ 5000,
# pairs[i].length = 2.

# [output] string
def swapLexOrder(s, p)
    h = {}
    p.each do |a,b|
        h[a] ||= {}
        h[b] ||= {}
        h[a].merge!(h[b])
        h[a][b] = 1
        h[a].each {|k,v| h[k] = h[a]}
        h[a][a] = 1
    end
    
    l = {}
    h.each do |k,v|
        a = []
        next if l[k]
        z = v.keys.sort
        z.each do |i|
            a << s[i-1]
            l[i] = 1
        end
        a.sort!.reverse!
        z.length.times {|i| s[z[i]-1] = a[i]}
    end
    s
end

