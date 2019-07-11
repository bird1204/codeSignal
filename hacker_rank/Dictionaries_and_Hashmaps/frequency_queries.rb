#!/bin/ruby

require 'json'
require 'stringio'

# Complete the freqQuery function below.
def freqQuery(queries)

    a = Hash.new(0)
    h = Hash.new(0)
    o = []

    queries.each do |cmd, p|
        if cmd == 1
            h[a[p]] -= 1 if h[a[p]] > 0
            a[p] += 1 
            h[a[p]] += 1
        elsif cmd == 3
            h[p] > 0 ? o << 1 : o << 0
        elsif a[p] > 0
            h[a[p]] -= 1
            a[p] -= 1 
            h[a[p]] += 1
        end
   end
   puts a.to_s
   puts h.to_s
   puts o
   o
end
fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.strip.to_i

queries = Array.new(q)

q.times do |i|
    queries[i] = gets.rstrip.split.map(&:to_i)
end

ans = freqQuery queries

fptr.write ans.join "\n"
fptr.write "\n"

fptr.close()
