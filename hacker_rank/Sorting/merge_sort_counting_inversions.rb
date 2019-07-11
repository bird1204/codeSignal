#!/bin/ruby

require 'json'
require 'stringio'
require 'ostruct'


# Complete the countInversions function below.
def countInversions(arr)
  metadata = OpenStruct.new(inversions: 0)
  mergesort! arr.dup, arr.dup, 0, arr.size-1, metadata
  return metadata.inversions
end

# uses an auxiliary array that gets swapped out on recursive calls
def mergesort!(src, dst, lo, hi, metadata)
  return if hi <= lo

  mid = lo + (hi - lo) / 2
  mergesort! dst, src, lo, mid, metadata
  mergesort! dst, src, mid+1, hi, metadata
  merge! src, dst, lo, mid, hi, metadata
end

def merge!(src, dst, lo, mid, hi, metadata)
  i, j = lo, mid+1
  for k in lo..hi do
    if i > mid              # append rest of right
      dst[k] = src[j]; j += 1
    elsif j > hi            # append rest of left
      dst[k] = src[i]; i += 1
    elsif src[i] <= src[j]  # append left
      dst[k] = src[i]; i += 1
    else                    # append right
      dst[k] = src[j]; j += 1
      metadata.inversions += mid + 1 - i
    end
  end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    arr = gets.rstrip.split(' ').map(&:to_i)

    result = countInversions arr
    fptr.write result
    fptr.write "\n"
end

fptr.close()
