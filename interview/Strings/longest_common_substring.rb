# Given two strings, s and t, find the length of their longest common substring.

# Example

# For s = "abcdxyz" and t = "xyzabcd", the output should be
# longestCommonSubstring(s, t) = 4;

# For s = "zxabcdezy" and t = "yzabcdezx", the output should be
# longestCommonSubstring(s, t) = 6.

# The longest common substring is "abcdez" and has a length of 6
def longestCommonSubstring(s, t)
    @modulo = 10 ** 9 + 7
    @prime = 103
    @s = s.each_byte.to_a
    @t = t.each_byte.to_a
    def rolling_hash f,m 
        tmp =  {}
        power, k = 1, 0 
        0.upto(~-m) { |i| k, power = k % @modulo + f[i] * power % @modulo, power * @prime % @modulo}
        tmp[k] = ~-m 
        m.upto(f.size - 1) {|i| k = (k + f[i] * power -  f[i-m]) * 572815538 % @modulo
            tmp[k] = i}
        tmp 
    end
    def binary_search m
        hash = rolling_hash(@s, m)
        rolling_hash(@t, m).each {|k, j|
            return true if hash.has_key?(k) && @s[(hash[k] - m + 1)..hash[k]] == @t[(j - m + 1)..j] }
        false
    end
    left = 0
    right = [s.size, t.size].min
    binary_search(middle = left + right + 1 >> 1 ) ? left = middle : right = middle - 1  while left < right
    left
end