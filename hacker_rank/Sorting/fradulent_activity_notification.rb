#!/bin/ruby

require 'json'
require 'stringio'

# Complete the activityNotifications function below.
def activityNotifications(expenditure, d)
    # Frequence array to cover all expense amounts $0-200
    freqs = Array.new(201){0}
    # Queue to calculate the median for d trailing days only
    queue = []
    counter = 0
    expenditure.each_with_index do |exp, i|
        # To start (before d items), populate the queue and freq table only
        if i < d
            queue << exp
        else
            # Get median and increase count if necessary
            count += 1 if exp >= 2 * median(freqs, d)
            # Removing outgoing element from queue and freq array
            freqs[queue.shift] -= 1
            # Add incoming element to queue and freq array
            queue << exp
        end
        freqs[exp] += 1
    end
    counter
end

def two_plus_median(freqs, d)
    center = 0
    middle = nil
    freqs.each_with_index do |freq, idx|
        # Tally frequencies until we reach the middle of the distribution
        center += freq
        # Grab the center-most index in case we need to compare two middle values
        middle = idx if center >= d / 2 unless middle
        # Once middle reached, if odd number return current index, otherwise average, then product 2 on it.
        if center > d / 2
            median = d % 2 == 1 ? idx : ((middle + idx) / 2.0)
            return 2 * median
        end
    end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nd = gets.rstrip.split

n = nd[0].to_i

d = nd[1].to_i

expenditure = gets.rstrip.split(' ').map(&:to_i)

result = activityNotifications expenditure, d

fptr.write result
fptr.write "\n"

fptr.close()
