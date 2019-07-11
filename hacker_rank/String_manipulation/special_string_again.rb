#!/bin/ruby

require 'json'
require 'stringio'

# Complete the substrCount function below.
def substrCount(n, s)
  # since each individual character is a valid special palindromic string, there will be at least n results.
  result = n
  
  for i in 0..n-2
    j = i
        
    # if next character is the same, that's a valid special palindrome string
    while s[i] == s[j+1]
      result += 1
      j += 1
    end
    
    j += 1
    # check next characters to see if it's a valid sandwich
    start_ind = j+1
    end_ind = j + (j-i) 
    if s[start_ind..end_ind] == s[i..j-1]
      result += 1
    end
    
    i += 1
  end
  
  result
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

s = gets.to_s.rstrip

result = substrCount n, s

fptr.write result
fptr.write "\n"

fptr.close()
