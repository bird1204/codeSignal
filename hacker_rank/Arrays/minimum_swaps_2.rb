#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumSwaps function below.
def minimumSwaps(arr)
  arr = arr.map { |n| n - 1 }

  i = 0
  counter = 0

  while arr[i] != i do
    i += 1 if arr[i] == i
    if arr[i] && arr[i] != i
      arr[arr[i]], arr[i] = arr[i], arr[arr[i]]
      counter += 1
    end
  end

  counter
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

res = minimumSwaps arr

fptr.write res
fptr.write "\n"

fptr.close()
