# You are planning to rob houses on a specific street, and you know that every house on the street has a certain amount of money hidden. The only thing stopping you from robbing all of them in one night is that adjacent houses on the street have a connected security system. The system will automatically trigger an alarm if two adjacent houses are broken into on the same night.

# Given a list of non-negative integers nums representing the amount of money hidden in each house, determine the maximum amount of money you can rob in one night without triggering an alarm.

# Example

# For nums = [1, 1, 1], the output should be
# houseRobber(nums) = 2.

# The optimal way to get the most money in one night is to rob the first and the third houses for a total of 2.
def houseRobber(nums)
    res = []
    nums.each_with_index{|num, i|
      case i
        when 0
          res[i] = num; next
        when 1
          res[i] = [nums[0], num].max
        else
          res[i] = [num + res[i-2].to_i, res[i-1].to_i].max
        end
    }
    res.last.to_i
end