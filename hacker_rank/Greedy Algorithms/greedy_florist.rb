#!/bin/ruby

require 'json'
require 'stringio'

# Complete the getMinimumCost function below.
def getMinimumCost(k, c)
    cost = 0
    c.sort.reverse.each_with_index do |price, idx|
        # (previous purchases + current purchases) * price
        sub_cost = ((idx / k) + 1) * price 
        puts "((#{idx} / #{k}) + 1) * #{price} = #{sub_cost}"
        cost += sub_cost
    end
    cost
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

c = gets.rstrip.split(' ').map(&:to_i)

minimumCost = getMinimumCost k, c

fptr.write minimumCost
fptr.write "\n"

fptr.close()
