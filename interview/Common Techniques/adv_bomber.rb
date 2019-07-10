# Each cell in a 2D grid contains either a wall ('W') or an enemy ('E'), or is empty ('0'). Bombs can destroy enemies, but walls are too strong to be destroyed. A bomb placed in an empty cell destroys all enemies in the same row and column, but the destruction stops once it hits a wall.

# Return the maximum number of enemies you can destroy using one bomb.

# Note that your solution should have O(field.length · field[0].length) complexity because this is what you will be asked during an interview.
def bomber(b)
        final = k(b.transpose).transpose.zip(k b).map {|l, r|
        l.zip(r).map {|x, y| x + y }
    }
    final = final.flatten.max
    return 0 if final == nil
    final
end

def k b
    b.map {|r|
        r.chunk {|x| x == "W" }.flat_map {|_, g|
            g.map {|q| q == "0" ? g.count("E") : 0 }
        }
    }
end