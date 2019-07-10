# Given an array of integers a and an integer sum, find all of the unique combinations in a that add up to sum.
# The same number from a can be used an unlimited number of times in a combination.
# Elements in a combination (a1 a2 … ak) must be sorted in non-descending order, while the combinations themselves must be sorted in ascending order.
# If there are no possible combinations that add up to sum, the output should be the string "Empty".

# Example

# For a = [2, 3, 5, 9] and sum = 9, the output should be
# combinationSum(a, sum) = "(2 2 2 3)(2 2 5)(3 3 3)(9)".
def combinationSum(a, sum)
    a.sort!&.uniq!
    puts a.to_s

    memo = Hash.new
    find_combos = -> (cur_index, cur_sum) do 
        if cur_sum == sum
            return [[]]
        elsif cur_sum > sum || cur_index == a.length
            return []
        else
            ans = []
            [cur_index, cur_index+1].zip([cur_sum+a[cur_index], cur_sum]).each_with_index do |(index, new_sum), i|
                memo["#{index},#{new_sum}"] ||= find_combos.call(index, new_sum)
                memo["#{index},#{new_sum}"].each do |arr|
                    ans << (i==1 ? [] : [a[index]]) + arr
                end
            end
            
            return ans
        end
    end
    
    vals = find_combos.call(0, 0)
    vals.empty? ? "Empty" : vals.map.inject(""){|s, arr| s += "(" + arr.join(" ") + ")"}
end

