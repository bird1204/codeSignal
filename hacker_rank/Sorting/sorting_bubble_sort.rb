#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countSwaps function below.
def countSwaps(items)
    len = items.size
    counter = 0
    for i in 0..len
        j = 0
        stop = len - i
        while j < stop - 1 do
            if items[j] > items[j + 1]
                items = swap(items, j, j + 1)
                counter += 1
            end
            j += 1
        end
    end
    puts "Array is sorted in #{counter} swaps."
    puts "First Element: #{items.first}"
    puts "Last Element: #{items.last}"
    return items
end

def swap(items, firstIndex, secondIndex)
    temp = items[firstIndex]
    items[firstIndex] = items[secondIndex]
    items[secondIndex] = temp
    return items
end

n = gets.to_i

a = gets.rstrip.split(' ').map(&:to_i)

countSwaps a
