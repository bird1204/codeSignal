#!/bin/ruby

require 'json'
require 'stringio'

# Complete the sherlockAndAnagrams function below.
def sherlockAndAnagrams(s)
    counter = Hash.new(0)
    (1..s.size).each do |length|
        s.chars.each_cons(length) do |sub_str| 
            counter[sub_str.sort.join] += 1
        end
    end
    counter.values.map { |n| n * (n - 1) / 2 }.sum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |q_itr|
    s = gets.to_s.rstrip

    result = sherlockAndAnagrams s

    fptr.write result
    fptr.write "\n"
end

fptr.close()
