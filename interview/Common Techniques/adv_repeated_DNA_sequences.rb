# All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T. In research, it can be useful to identify repeated sequences within DNA.

# Write a function to find all the 10-letter sequences (substrings) that occur more than once in a DNA molecule s, and return them in lexicographical order. These sequences can overlap.

# Example

# For s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT", the output should be
# repeatedDNASequences(s) = ["AAAAACCCCC", "CCCCCAAAAA"].

def repeatedDNASequences(s)
  s.scan(/(?=(.{10}))(?=.+\1)/).flatten.uniq.sort
end