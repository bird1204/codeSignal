# Note: Avoid using regular expressions and implement regex matching yourself in your solution, since this is what you would be asked to do during a real interview.

# Implement regular expression matching with support for '.' and '*', given the following guidelines:
# '.' Matches any single character.
# '*' Matches zero or more of the element that comes before it.

# The matching should cover the entire input string s. If the pattern p matches the input string s, return true, otherwise return false.

# Example

# For s = "bb" and p = "b", the output should be
# regularExpressionMatching(s, p) = false;
# For s = "zab" and p = "z.*", the output should be
# regularExpressionMatching(s, p) = true;
# For s = "caab" and p = "d*c*x*a*b", the output should be
# regularExpressionMatching(s, p) = true.

def regularExpressionMatching(s, p)
    s[/#{p}/] == s
end

# method 2
# def regularExpressionMatching(s, p)
#     return s.empty? if p.empty? # end of the pattern
         
#     current_match = !s.empty? && ['.', s[0]].include?(p[0])
    
#     if ( (p.length >= 2) && (p[1] == '*') )
#         ( current_match && regularExpressionMatching(s[1..-1], p) ) or
#         regularExpressionMatching(s, p[2..-1])
#     else
#         current_match && regularExpressionMatching(s[1..-1], p[1..-1])
#     end
# end

