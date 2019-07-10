# Note: Try to solve this task in O(n3) time, where n is a number of currencies, since this is what you'll be asked to do during an interview.

# A currency converter has the exchange rates exchange, such that exchange[i][j] represents the amount of money you would get for exchanging 1 unit of the ith currency for 1 unit of the jth currency. A "non-exchange" (that is, exchanging a currency with itself) is represented by exchange[i][i] = 1.

# Write a function that returns True if it's possible to make money by doing a series of exchanges (i.e. to start with some currency C and to end with a greater amount of currency C after a series of exchanges), and False otherwise.

# Example

# For exchange = [[1, 0.5, 0.2], [1.8, 1, 0.5], [3.95, 1.2, 1]], the output should be
# currencyArbitrage(exchange) = false.
# There is no way of transferring money through a series of exchanges to make more money. For example, taking $1 from currency 0, we can get $0.50 (currency 1), then get $0.25 (currency 2) and finally $0.9875 (currency 0). This is an example of one series of exchanges; there is no possible series of exchanges that makes money.

# For exchange = [[1, 0.5, 0.2], [1.8, 1, 0.5], [4.05, 1.2, 1]], the output should be
# currencyArbitrage(exchange) = true.
# Taking $1 from currency 0, we can get $0.50 (currency 1), then get $0.25 (currency 2), and finally get $1.0125 (currency 0).

# For exchange = [[1, 0.5, 0.2], [2.05, 1, 0.5], [3.3, 1.2, 1]], the output should be
# currencyArbitrage(exchange) = true.
# Taking $1 from currency 0, we can get $0.50 (currency 1), and then get $1.025 (currency 0).
def currencyArbitrage(exchange)
    (0...exchange.length).each do |i|
         (i...exchange.length).each do |j|
             (j...exchange.length).each do |k|
                 product=exchange[i][j]
                 product*=exchange[j][k]
                 product*=exchange[k][i]
                 return true if product>1
             end
         end
    end
    false
end