# Given an array of words and a length l, format the text such that each line has exactly l characters and is fully justified on both the left and the right. Words should be packed in a greedy approach; that is, pack as many words as possible in each line. Add extra spaces when necessary so that each line has exactly l characters.

# Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line does not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right. For the last line of text and lines with one word only, the words should be left justified with no extra space inserted between them.

# Example

# For
# words = ["This", "is", "an", "example", "of", "text", "justification."]
# and l = 16, the output should be

# textJustification(words, l) = ["This    is    an",
#                                "example  of text",
#                                "justification.  "]
def textJustification(words, l)
    lines = []
    i = 0
    while i<words.length
        count = 0
        len = 0
        print 'len=' + len.to_s + '   '
        while i+count<words.length
            len += words[i+count].length + (count>0 ? 1 : 0)
            print 'len=' + len.to_s + '   '            
            break if len>l
            maxLen = len
            count += 1
        end
        print 'words=' + words[i..i+count-1].to_s + ', maxLen=' + maxLen.to_s + '   '
        line = nil
        if i<words.length-count
            line = justify(words[i..i+count-1], l)
        else
            line = words[i..i+count-1].join(' ')
            line += ' ' * (l - line.length)
        end    
        lines.push(line)
        print 'i=' + i.to_s + ', count=' + count.to_s + '   '
        i += count
    end
    lines
end

def justify(words, l)
    return words[0] + ' ' * (l-words[0].length) if words.length==1
    totalSpaces = l - words.map{|x| x.length}.sum
    avgSpaces = totalSpaces/(words.length-1)
    addSpaces = totalSpaces%(words.length-1)
    print 'avgSpaces=' + avgSpaces.to_s + ', addSpaces=' + addSpaces.to_s
    line = words.each_with_index.map{|x, i| x + (i<words.length-1 ? ' ' * (avgSpaces + (i<addSpaces ? 1 : 0)): '')}.join('')
end    