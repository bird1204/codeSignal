# A top secret message containing uppercase letters from 'A' to 'Z' has been encoded as numbers using the following mapping:

# 'A' -> 1
# 'B' -> 2
# ...
# 'Z' -> 26
# You are an FBI agent and you need to determine the total number of ways that the message can be decoded.

# Since the answer could be very large, take it modulo 109 + 7.

# Example

# For message = "123", the output should be
# mapDecoding(message) = 3.

# "123" can be decoded as "ABC" (1 2 3), "LC" (12 3) or "AW" (1 23), so the total number of ways is 3.
def mapDecoding(message)
    return 0 if message[0] == '0'
    mod = 10 ** 9 + 7
    res = [0] * (message.length + 1)
    res[0] = res[1] = 1
    (2..message.length).each do |i|
        if message[i-1] == '0' && (message[i-2,2].to_i > 26 || message[i-2,2].to_i < 1)
            return 0
        end
        res[i] = res[i-1] if message[i-1] != '0'
        res[i] = (res[i] + res[i-2]) % mod if message[i-2] != '0' && message[i-2,2].to_i <= 26    
    end
    res[message.length]
end

