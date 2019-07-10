# You categorize strings into three types: good, bad, or mixed. If a string has 3 consecutive vowels or 5 consecutive consonants, or both, then it is categorized as bad. Otherwise it is categorized as good. Vowels in the English alphabet are ["a", "e", "i", "o", "u"] and all other letters are consonants.

# The string can also contain the character ?, which can be replaced by either a vowel or a consonant. This means that the string "?aa" can be bad if ? is a vowel or good if it is a consonant. This kind of string is categorized as mixed.

# Implement a function that takes a string s and returns its category: good, bad, or mixed.

# Example

# For s = "aeu", the output should be
# classifyStrings(s) = "bad";

# For s = "a?u", the output should be
# classifyStrings(s) = "mixed";

# For s = "aba", the output should be
# classifyStrings(s) = "good".
def classifyStrings(s)
    v="aeiou"
    c=""
    ("b".."z").each do |letter|
        c+=letter if !v.include?(letter)
    end
    vq=v+"?"
    cq=c+"?"
    temp=s
    while /[#{v}]{2}[?]/.match(temp) || /[?][#{v}]{2}/.match(temp) || /[#{c}]{4}[?]/.match(temp) || /[?][#{c}]{4}/.match(temp)
        temp=temp.gsub(/[#{v}]{2}[?]/, "aac")
        temp=temp.gsub(/[?][#{v}]{2}/, "caa")
        temp=temp.gsub(/[#{c}]{4}[?]/, "cccca")
        temp=temp.gsub(/[?][#{c}]{4}/, "acccc")
        if /[#{v}]{3,}/.match(temp)
            return "bad"
        elsif /[#{c}]{5,}/.match(temp)
            return "bad"
        end
    end
    if /[#{v}]{3,}/.match(s)
        return "bad"
    elsif /[#{c}]{5,}/.match(s)
        return "bad"
    elsif /[#{v}]{2,}[?][#{c}]{4,}/.match(s)
        return "bad"
    elsif /[#{v}]{2,}[?][#{c}]{3,}[?][#{v}]{2,}/.match(s)
        return "bad"
    elsif /[#{c}]{4,}[?][#{v}]{1,}[?][#{c}]{4,}/.match(s)
        return "bad"
    elsif /[#{vq}]{3,}/.match(s)
        return "mixed"
    elsif /[#{cq}]{5,}/.match(s)
        return "mixed"
    end
    "good"
end

