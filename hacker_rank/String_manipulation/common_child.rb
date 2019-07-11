#!/bin/ruby

require 'json'
require 'stringio'

# Complete the commonChild function below.
def commonChild(s1, s2)
    a = s1
    b = s2 
    last, current = Array.new(b.size+1, 0), nil
    i = 0
    while i <= a.size-1
        current = Array.new(b.size+1, 0)
        j = 0
        while j <= b.size-1
            if a[i] == b[j] 
                current[j+1] = last[j] + 1
            else
                current[j+1] = current[j] >= last[j+1] ? current[j] : last[j+1]
            end
            j += 1
        end
        last = current
        i += 1
    end

    current.max
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s1 = gets.to_s.rstrip

s2 = gets.to_s.rstrip

result = commonChild s1, s2

fptr.write result
fptr.write "\n"

fptr.close()
