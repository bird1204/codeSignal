# A string is a k-palindrome if it can be transformed into a palindrome by removing any amount of characters from 0 to k. Your task is to determine whether the given string s is a k-palindrome.

# Example

# For s = "abrarbra" and k = 1, the output should be
# kpalindrome(s, k) = true.

# You can remove one letter, 'r', to obtain the string "abrarba", which is a palindrome.

# For s = "adbcdbacdb" and k = 2, the output should be
# kpalindrome(s, k) = false.
def length_lcs(s, t)
  dp = Array.new(s.size + 1) { Array.new(t.size + 1) }
  dp[0][0] = 0
  (1..s.size).each { |i| dp[i][0] = 0 }
  (1..t.size).each { |j| dp[0][j] = 0 }

  (1..s.size).each do |i|
    (1..t.size).each do |j|
      dp[i][j] = s[i - 1] == t[j - 1] ?
                   dp[i - 1][j - 1] + 1 :
                   [dp[i - 1][j], dp[i][j - 1]].max
    end
  end
  dp[s.size][t.size]
end

def kpalindrome(s, k)
  length_lcs(s, s.reverse) + k >= s.size
end

