N, M = gets.chomp.split(' ').map(&:to_i)

# create array of zeros of length N + 1
arr = Array.new(N + 1, 0)

M.times do
    # cycle through and get the inputs
    start, finish, value = gets.chomp.split(' ').map(&:to_i)

    # increment value at start of sequence
    arr[start - 1] += value

    # decrement value at first position after sequence
    arr[finish] -= value
end

tmp = 0
max = 0

arr.each do |value|
    # step through summing array
    tmp += value

    # capture the max value of tmp
    max = tmp if max < tmp
end

puts max
