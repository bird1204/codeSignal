# Implement the missing code, denoted by ellipses. You may not modify the pre-existing code.
# You are given an array of integers. Sort its sub-array between the given indices l and r (inclusive) and leave the other elements intact.
def quickSort(a, l, r)

    if l >= r
        return a
    end

    x = a[l]
    i = l
    j = r

    while i <= j do
        while a[i] < x do
            i += 1
        end
        while a[j] > x do
            j -= 1
        end
        if i <= j
            t = a[i]
            a[i] = a[j]
            a[j] = t
            i += 1
            j -= 1
        end
    end

    # recovering here
    quickSort(a, l, j)
    quickSort(a, i, r)



    return a
end

