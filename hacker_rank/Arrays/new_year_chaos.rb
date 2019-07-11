#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumBribes function below.
def minimumBribes(q)
    bribe = 0
    (q.size - 1).downto(0).each do |idx|
        if(q[idx] - idx - 1) > 2
            puts "Too chaotic"
            return
        end
        ([q[idx]-2, 0].max..idx).each do |idx_2|
            bribe += 1 if q[idx_2] > q[idx]
        end
    end
    puts bribe
end

t = gets.to_i
t.times do |t_itr|
    n = gets.to_i

    q = gets.rstrip.split(' ').map(&:to_i)

    minimumBribes q
end
