#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countTriplets function below.
def countTriplets(arr, r)
    double = {}
    triple = {}
    counter = 0

    arr.each do |c|
        counter += triple[c] if triple.has_key?(c)

        if double.has_key?(c)
            if triple.has_key?(c*r)
                triple[c*r] += double[c]
            else
                triple[c*r] = double[c]
            end
        end

        if double.has_key?(c*r)
            double[c*r] += 1
        else
            double[c*r] = 1
        end
    end
    counter
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nr = gets.rstrip.split

n = nr[0].to_i

r = nr[1].to_i

arr = gets.rstrip.split.map(&:to_i)

ans = countTriplets arr, r

fptr.write ans
fptr.write "\n"

fptr.close()
