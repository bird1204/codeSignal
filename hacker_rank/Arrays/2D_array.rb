def a_map(arr, i, j)
  [arr[i][j], arr[i][j+1], arr[i][j+2], 
              arr[i+1][j+1], 
   arr[i+2][j], arr[i+2][j+1], arr[i+2][j+2]]
end 

def hourGlassSum(arr)
  times = arr.length-3 #determine times to iterate
  result = []
  (0..times).to_a.each do |i|
    (0..times).to_a.each do |j|
      #using double loop store arrays representing all of the hourglasses
      #and sum them up in the same line
      result << a_map(arr, i, j).inject(:+)
    end  
  end
  result.sort[-1] #sort resulting array, return last element
end