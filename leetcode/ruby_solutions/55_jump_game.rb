#########################
# 55. Jump Game
#
# You are given an integer array nums. You are initially positioned at the array's first index, and 
# each element in the array represents your maximum jump length at that position.
#
# Return true if you can reach the last index, or false otherwise.
#
# Example 1:
#   Input: nums = [2,3,1,1,4]
#   Output: true
#   Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
# Example 2:
#   Input: nums = [3,2,1,0,4]
#   Output: false
#   Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, 
#     which makes it impossible to reach the last index.
#
# Constraints:
#   1 <= nums.length <= 104
#   0 <= nums[i] <= 105
#########################
# @param {Integer[]} nums
# @return {Boolean}
# As we iterate over each num in the nums Array, track the
# farther possible index we could reach which is the sum of
# the current index plus the current num. If the current index
# is ever larger than the farthest reachable index then it's not
# possible to reach the last index.
def can_jump(nums)
    farthest_idx = 0

    nums.each_with_index do |num, idx|
        return false if idx > farthest_idx

        farthest_idx = [(num + idx), farthest_idx].max

        return true if farthest_idx >= nums.length - 1
    end
end
#########################
# Beats 41% Runtime, 62% Memory
#########################
