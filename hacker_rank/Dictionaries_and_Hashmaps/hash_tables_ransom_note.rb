#!/bin/ruby

require 'json'
require 'stringio'

# Complete the checkMagazine function below.
def checkMagazine(magazine, note)
    hash = magazine.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
    str = 'Yes'
    note.each do |char|
        if hash[char] > 0
            hash[char] -= 1
        else
            str = 'No'
        end
    end
    puts str
end

mn = gets.rstrip.split

m = mn[0].to_i

n = mn[1].to_i

magazine = gets.rstrip.split(' ').map(&:to_s).sort

note = gets.rstrip.split(' ').map(&:to_s).sort

checkMagazine magazine, note
