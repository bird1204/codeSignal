#!/bin/ruby

require 'json'
require 'stringio'

# Complete the makeAnagram function below.
def makeAnagram(a, b)
    sum = 0
    hash = {}
    a.strip.chars.each { |t| hash[t] ||= 0; hash[t] += 1 }
    b.strip.chars.each { |t| hash[t] ||= 0; hash[t] -= 1 }
    hash.values.map(&:abs).each { |t| sum += t }
    sum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

a = gets.to_s.rstrip

b = gets.to_s.rstrip

res = makeAnagram a, b

fptr.write res
fptr.write "\n"

fptr.close()

