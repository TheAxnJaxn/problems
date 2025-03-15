#########################
# 1. Two Sum
#
# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# You can return the answer in any order.
#
# Example 1:
#   Input: nums = [2,7,11,15], target = 9
#   Output: [0,1]
#   Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
# Example 2:
#   Input: nums = [3,2,4], target = 6
#   Output: [1,2]
# Example 3:
#   Input: nums = [3,3], target = 6
#   Output: [0,1]
#
# Constraints:
#   2 <= nums.length <= 10^4
#   -10^9 <= nums[i] <= 10^9
#   -10^9 <= target <= 10^9
#   Only one valid answer exists.
#
#########################
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# Build a Hash num_i from Array nums, where the Array elements become the Hash keys and
# the Array index of each element becomes the Hash values, checking if the current num
# already has another num stored in the Hash such that they'd add up to the target.
def two_sum(nums, target)
  num_i = {}

  nums.each_with_index do |n, i|
      return [i, num_i[target - n]] if num_i.key?(target - n)
      num_i[n] = i
  end

  []
end
#########################
# Beats 60% Runtime, 52% Memory
# O(n) Time Complexity, O(n) Space Complexity
