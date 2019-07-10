# Implement the missing code, denoted by ellipses. You may not modify the pre-existing code.
# Note: Avoid using built-in functions that convert integers to their binary representations. Write the solution that uses O(k) operations per test, where k is the number of bits set to 1.

# Write a function that takes an unsigned (positive) integer and returns the number of 1 bits its binary representation contains. This value is also known as the integer's Hamming weight.
def numberOf1Bits(n)
    res = 0
    while n != 0
        n &= (n - 1)
        res += 1
    end
    return res
end