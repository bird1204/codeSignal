# Boggle is a popular word game in which players attempt to find words in sequences of adjacent letters on a rectangular board.

# Given a two-dimensional array board that represents the character cells of the Boggle board and an array of unique strings words, find all the possible words from words that can be formed on the board.

# Note that in Boggle when you're finding a word, you can move from a cell to any of its 8 neighbors, but you can't use the same cell twice in one word.

# Example

# For

# board = [
#     ['R', 'L', 'D'],
#     ['U', 'O', 'E'],
#     ['C', 'S', 'O']
# ]
# and words = ["CODE", "SOLO", "RULES", "COOL"], the output should be
# wordBoggle(board, words) = ["CODE", "RULES"].

def createBoardHash(board)
    hash = {}

    (0...board.size).each do |x|
        board[x].each_with_index do |letter, y|
            hash[letter] ||= []
            hash[letter] << [x, y]
        end
    end

    hash
end

def checkWord(board_hash, word, position=nil)
    letter = word[0]

    return false if board_hash[letter].nil? || board_hash[letter].empty?

    board_hash[letter].map do |coords|
        if position.nil? || (coords[0].between?(position[0] - 1, position[0] + 1) &&
                             coords[1].between?(position[1] - 1, position[1] + 1))

            return true if word.size == 1
            new_hash = board_hash.dup
            new_hash[letter] = new_hash[letter].dup
            new_hash[letter].delete(coords)
            checkWord(new_hash, word[1..-1], coords)
        else
          false
        end
    end.any?
end

def wordBoggle(board, words)
    board_hash = createBoardHash(board)
    words.select { |word| checkWord(board_hash, word) }.sort
end