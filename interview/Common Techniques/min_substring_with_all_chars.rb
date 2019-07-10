# You have two strings, s and t. The string t contains only unique elements. Find and return the minimum consecutive substring of s that contains all of the elements from t.

# It's guaranteed that the answer exists. If there are several answers, return the one which starts from the smallest index.

# Example

# For s = "adobecodebanc" and t = "abc", the output should be
# minSubstringWithAllChars(s, t) = "banc".
def minSubstringWithAllChars(s, t)
    (0..s.size).lazy.map { |l|
        (0..s.size - l).lazy.map { |i| s[i, l] }
            .find { |x| t.each_char.all? { |c| x[c] } }
    }.find { |x| x }
end

