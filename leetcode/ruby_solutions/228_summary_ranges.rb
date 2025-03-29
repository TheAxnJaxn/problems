#########################
# 228. Summary Ranges
#
# You are given a sorted unique integer array nums.
#
# A range [a,b] is the set of all integers from a to b (inclusive).
#
# Return the smallest sorted list of ranges that cover all the numbers in the array exactly.
# That is, each element of nums is covered by exactly one of the ranges, and there is
# no integer x such that x is in one of the ranges but not in nums.
#
# Each range [a,b] in the list should be output as:
#   "a->b" if a != b
#   "a" if a == b
#
# Example 1:
#   Input: nums = [0,1,2,4,5,7]
#   Output: ["0->2","4->5","7"]
#   Explanation: The ranges are:
#     [0,2] --> "0->2"
#     [4,5] --> "4->5"
#     [7,7] --> "7"
# Example 2:
#   Input: nums = [0,2,3,4,6,8,9]
#   Output: ["0","2->4","6","8->9"]
#   Explanation: The ranges are:
#     [0,0] --> "0"
#     [2,4] --> "2->4"
#     [6,6] --> "6"
#     [8,9] --> "8->9"
#
# Constraints:
#   0 <= nums.length <= 20
#   -2^31 <= nums[i] <= 2^31 - 1
#   All the values of nums are unique.
#   nums is sorted in ascending order.
#
#########################
# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  ranges = []
  left = 0

  nums.each_index do |right|
      next if nums[right + 1] == nums[right] + 1
      ranges << [nums[left], nums[right]].uniq.join("->")
      left = right + 1
  end

  ranges
end
#########################
# Time complexity O(n), Space complexity O(n)
# Beats 100% Runtime, 48% Memory