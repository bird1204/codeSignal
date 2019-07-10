# Implement the missing code, denoted by ellipses. You may not modify the pre-existing code.
# Sort an array of integers.
def mergeArrays(sequence, l, m, r)
  i = l
  j = m
  result = Array.new
  while i < m && j < r do
    if sequence[i] < sequence[j]
      result.push(sequence[i])
      i += 1
    else
      result.push(sequence[j])
      j += 1
    end
  end

  while i < m do
    result.push(sequence[i])
    i += 1
  end
  while j < r do
    result.push(sequence[j])
    j += 1
  end
  for i in l..(r - 1) do
    sequence[i] = result[i - l]
  end
end

def split(sequence, l, r)
  # recovering here
  return if l+1 == r
     
  m = (l + r) / 2
  split(sequence, l, m)
  split(sequence, m, r)
  mergeArrays(sequence, l, m, r)
end

def mergeSort(sequence)
  split(sequence, 0, sequence.length)
  return sequence
end

