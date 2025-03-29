# 209. Minimum Size Subarray Sum
#
# Given an array of positive integers nums and a positive integer target,
# return the minimal length of a subarray whose sum is greater than or equal to target.
# If there is no such subarray, return 0 instead.
#
# Example 1:
#   Input: target = 7, nums = [2,3,1,2,4,3]
#   Output: 2
#   Explanation: The subarray [4,3] has the minimal length under the problem constraint.
# Example 2:
#   Input: target = 4, nums = [1,4,4]
#   Output: 1
# Example 3:
#   Input: target = 11, nums = [1,1,1,1,1,1,1,1]
#   Output: 0
#
# Constraints:
#   1 <= target <= 10^9
#   1 <= nums.length <= 10^5
#   1 <= nums[i] <= 10^4
#
# @param {Integer} target
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(target, nums)
  min_len = nums.length
  left = right = sum = 0

  while right < nums.length
      sum += nums[right]
      right += 1
      while sum >= target
          min_len = [min_len, right - left].min
          sum -= nums[left]
          left += 1
      end
  end

  return 0 if sum < target && left == 0 && right == nums.length
  return min_len
end
#########################
# Beats 100% Runtime, 20% Memory
