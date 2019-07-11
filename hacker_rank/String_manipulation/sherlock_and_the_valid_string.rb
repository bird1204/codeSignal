#!/bin/ruby

require 'json'
require 'stringio'

# Complete the isValid function below.
def isValid(s)
    hash = s.strip.chars.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
    puts hash.to_s
    values = hash.values.sort
    if values.count(values[0]) == values.size or
        (values.count(values[0]) == values.size - 1 and values[-1] - values[-2] == 1) or 
        (values.count(values[-1]) == values.size - 1 and values[0] == 1)
        "YES"
    else
        "NO"
    end

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

result = isValid s

fptr.write result
fptr.write "\n"

fptr.close()
