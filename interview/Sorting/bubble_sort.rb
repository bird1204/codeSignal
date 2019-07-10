# Implement the missing code, denoted by ellipses. You may not modify the pre-existing code.
# Given an array of integers, sort it.

# Example

# For items = [2, 4, 1, 5], the output should be
# bubbleSort(items) = [1, 2, 4, 5].

def bubbleSort(items)

    def swap(items, firstIndex, secondIndex)
        temp = items[firstIndex]
        items[firstIndex] = items[secondIndex]
        items[secondIndex] = temp
        return items
    end

    # recovering here
    len = items.size

    for i in 0..len
        j = 0
        stop = len - i
        while j < stop - 1 do
            if items[j] > items[j + 1]
                items = swap(items, j, j + 1)
            end
            j += 1
        end
    end
    return items
end

