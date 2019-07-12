#!/bin/ruby

require 'json'
require 'stringio'

# Complete the reverseShuffleMerge function below.
def reverseShuffleMerge(s)
    count = s.chars.inject(Hash.new(0)) {|m,e| m[e] += 1; m }

    freq = Hash.new(0)
    used = Hash.new(0)
    count.each do |char, int|
        used[char] = used[char] || 0
        freq[char] = (freq[char] || 0) + count[char] / 2
    end

    str = [s[-1]]
    count[s[-1]] -= 1
    used[s[-1]] += 1

    s[0...s.size].reverse[1..s.size - 1].each_char do |char|
        count[char] -= 1
        next if used[char] >= freq[char]
        while str and str[-1] and char < str[-1] and count[str[-1]]>freq[str[-1]]-used[str[-1]]
            used[str.pop]-=1
        end
        str << char 
        used[char]+=1
    end
    str.join('')
end


fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

result = reverseShuffleMerge s

fptr.write result
fptr.write "\n"

fptr.close()
