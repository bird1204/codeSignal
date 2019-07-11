#!/bin/ruby

require 'json'
require 'stringio'

# Complete the maximumToys function below.
def maximumToys(prices, k)
    counter = 0
    prices.sort.each do |price|
        if (price <= k)
            counter += 1
            k -= price
        else
            break
        end
    end
    counter
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

prices = gets.rstrip.split(' ').map(&:to_i)

result = maximumToys prices, k

fptr.write result
fptr.write "\n"

fptr.close()
