#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumAbsoluteDifference function below.
def minimumAbsoluteDifference(arr)
    arr = arr.sort
    min_abs = (arr.max - arr.min).abs
    (1..arr.size - 1).each do |idx|
        abs = (arr[idx] - arr[idx - 1]).abs
        min_abs = abs if abs < min_abs
    end
    min_abs
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

result = minimumAbsoluteDifference arr

fptr.write result
fptr.write "\n"

fptr.close()
