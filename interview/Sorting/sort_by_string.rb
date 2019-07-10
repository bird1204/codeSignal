# Sort the letters in the string s by the order they occur in the string t.

# Example

# For s = "weather" and t = "therapyw", the output should be
# sortByString(s, t) = "theeraw";

# For s = "good" and t = "odg", the output should be
# sortByString(s, t) = "oodg".
def sortByString(s, t)
    s.split("").sort_by {|char| t.index(char) }.join("")
end