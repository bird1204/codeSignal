#!/bin/ruby

require 'json'
require 'stringio'

# Complete the maxMin function below.
def maxMin(k, arr)
    arr.sort!
    result = arr.last - arr.first
    (0..arr.size - k).each do |idx|
        diff = arr[idx + k - 1] - arr[idx]
        result = diff if diff < result
    end
    result
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

k = gets.to_i

arr = Array.new(n)

n.times do |i|
    arr_item = gets.to_i
    arr[i] = arr_item
end

result = maxMin k, arr

fptr.write result
fptr.write "\n"

fptr.close()
