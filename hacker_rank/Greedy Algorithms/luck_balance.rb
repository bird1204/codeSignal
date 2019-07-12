#!/bin/ruby

require 'json'
require 'stringio'

# Complete the luckBalance function below.
def luckBalance(k, contests)
    luck = 0
    can_loss_counter = contests.count{|l, t| t == 1} - k

    contests.sort_by!{|l, t| l}.each do |l, t|
        if t == 0 or can_loss_counter <= 0
            luck += l 
        else
            luck -= l
            can_loss_counter -= 1 
        end
    end
    luck
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

contests = Array.new(n)

n.times do |i|
    contests[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = luckBalance k, contests

fptr.write result
fptr.write "\n"

fptr.close()
