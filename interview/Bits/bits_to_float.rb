# Implement the missing code, denoted by ellipses. You may not modify the pre-existing code.
# You have a float number stored in a integer in a following format:

# The fractional part is stored in bits 0-15 (counting from the least significant bit)
# The integer part is stored in bits 16-30
# Return the input converted to a regular float (integer part.fractional part).
# Note that your answer will be considered correct if its absolute error does not exceed 10-3.
# Namely: let's assume that your answer is a, and the correct answer is b. The checker program will consider your answer correct, if |a - b| ≤ 10-3.

# Example

# For bits = 65539, the output should be
# bitsToFloat(bits) = 1.3.

# 6553910 = 00000000 00000001 00000000 000000112, so the integer part is 1 and the fractional part is 112 = 310.
def bitsToFloat(bits)
    intp = (bits&0xFFFF0000)>>16
    frap = Float(bits & 0xFFFF)
    while frap >= 1
        frap /= 10
    end
    return intp + frap
end

