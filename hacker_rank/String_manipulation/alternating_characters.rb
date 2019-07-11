#!/bin/ruby

require 'json'
require 'stringio'

# Complete the alternatingCharacters function below.
def alternatingCharacters(s)
    counter = 0
    s.each_char.with_index do |c, idx|
        next if c == s[0]
        counter += 1 if c == s[idx - 1]
    end
    counter
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |q_itr|
    s = gets.to_s.rstrip

    result = alternatingCharacters s

    fptr.write result
    fptr.write "\n"
end

fptr.close()
