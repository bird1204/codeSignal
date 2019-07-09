# You have a block with the dimensions 4 × n. Find the number of different ways you can fill this block with smaller blocks that have the dimensions 1 × 2. You are allowed to rotate the smaller blocks.

# Example

# For n = 1, the output should be
# fillingBlocks(n) = 1.

# There is only one possible way to arrange the smaller 1 × 2 blocks inside the 4 × 1 block.

# For n = 4, the output should be
# fillingBlocks(n) = 36.

# Here are the 36 possible configuration of smaller blocks inside the 4 × 4 block:
def fillingBlocks(n)
  f = Array.new(n, 0)
  f[1] = 1
  f[2] = 5
  f[3] = 11
  f[4] = 36
  (5..n).each do |i|
    f[i] = f[i-1] + 5 * f[i-2] + f[i-3] - f[i-4]
  end
  f[n]
end

