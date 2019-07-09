# You have two integer arrays, a and b, and an integer target value v. Determine whether there is a pair of numbers, where one number is taken from a and the other from b, that can be added together to get a sum of v. Return true if such a pair exists, otherwise return false.

# Example

# For a = [1, 2, 3], b = [10, 20, 30, 40], and v = 42, the output should be
# sumOfTwo(a, b, v) = true.

def sumOfTwo(a, b, v)
    a.each do |s_int|
        b.each do |b_int|
            return true if s_int + b_int == v
        end
    end
    false
end

# method 2
# def sumOfTwo(a, b, v)
#     needed_nums = a.map {|num| v - num}
#     (needed_nums & b).length > 0 ? true : false
# end

