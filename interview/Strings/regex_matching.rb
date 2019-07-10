# Given a pattern string and a test string, your task is to implement regex substring matching. If pattern is preceded by a ^, the pattern, excluding the ^, will be matched with the starting position of the test string. If pattern is followed by a $, the pattern, excluding the $, will be matched with the ending position of the test string. If no such markers are present, check whether pattern is a substring of test, regardless of its position.

# Example

# For pattern = "^code" and test = "codesignal", the output should be
# regexMatching(pattern, test) = true;
# For pattern = "nal$" and test = "codesignal", the output should be
# regexMatching(pattern, test) = true;
# For pattern = "hello" and test = "world", the output should be
# regexMatching(pattern, test) = false.
def regexMatching(pattern, test)
    test.include?(pattern) || test.match?(pattern)
end