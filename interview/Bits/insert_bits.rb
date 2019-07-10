# Given an integer n, replace its bits starting from the bit at position a to the bit at position b, inclusive, with the bits of integer k. Count from the least significant bit to the most significant bit, starting from 0.

# Example

# For n = 1024, a = 1, b = 6, and k = 17, the output should be
# insertBits(n, a, b, k) = 1058.
# n = 100 0000 00002, k = 1 00012, 1058 = 100 0010 00102.

# For n = 11, a = 1, b = 2, and k = 2, the output should be
# insertBits(n, a, b, k) = 13.
# n = 10112, k = 102, 13 = 11012.

# For n = 1, a = 3, b = 4, and k = 3, the output should be
# insertBits(n, a, b, k) = 25.
# n = 0 00012, k = 112, 25 = 1 10012.

def insertBits(n, a, b, k)
    diff   = b - a + 1
    n_bits = n.to_s(2).rjust(b + 1, "0")
    k_bits = k.to_s(2).rjust(diff, "0")
    n_bits[-(b + 1)..-(a + 1)] = k_bits
    n_bits.to_i(2)
end

