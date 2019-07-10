# You have two arrays of strings, 
# words and parts. Return an array that contains the strings from words, 
# modified so that any occurrences of the substrings from parts are surrounded by square brackets [], following these guidelines:

# If several parts substrings occur in one string in words, 
# choose the longest one. If there is still more than one such part, 
# then choose the one that appears first in the string.

# Example

# For words = ["Apple", "Melon", "Orange", "Watermelon"] and parts = ["a", "mel", "lon", "el", "An"], the output should be
# findSubstrings(words, parts) = ["Apple", "Me[lon]", "Or[a]nge", "Water[mel]on"].

# While "Watermelon" contains three substrings from the parts array, "a", "mel", and "lon", "mel" is the longest substring that appears first in the string.

def findSubstrings(words,parts)
   
z = "class Trie
    attr_accessor :keys
    def initialize
        @keys = {}
    end
    def add node
        keys[node.val] = node if keys[node.val].nil?
    end
    
    def prefix(arr)
        acc = ''
        n = self
        word = false
        arr.each do |char|
            if n.keys[char]
                n = n.keys[char]
                acc += n.val
                word = acc if n.leaf?
            else
                return word
            end
        end
        word
    end

    def insert(word)
        n = self
        word.chars.each do |char|
            if n.keys[char]
                n = n.keys[char]
            else
                n = n.add(Node.new(char))
            end
        end
        n.leaf!
        self
    end
end



class Node
    attr_accessor :keys, :val
    def initialize(val)
        @keys = {}
        @leaf = false
        @val = val
    end
    def leaf!
        @leaf = true
    end
    def leaf?
        @leaf
    end
    def add node
        keys[node.val] = node if keys[node.val].nil?
    end
  
end"
eval(z)



    # create Trie
    trie = Trie.new
    parts.each { |x| trie.insert(x)}
    # find replasefor words
    words.map{|w|
        arr = w.chars
        pat = false
        max = ""
        (0..arr.size-1).each do |x|
            pat = trie.prefix(arr[x..-1])
            max = pat if pat && max.size < pat.size
        end
        w.sub!(max,"[#{max}]") if !max.empty?
        w
    }
end