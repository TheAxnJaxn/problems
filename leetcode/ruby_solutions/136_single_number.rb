#########################
# 136. Single Number
#
# Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
#
# You must implement a solution with a linear runtime complexity and use only constant extra space.
#
# Example 1:
#   Input: nums = [2,2,1]
#   Output: 1
#
# Example 2:
#   Input: nums = [4,1,2,1,2]
#   Output: 4
#
# Example 3:
#   Input: nums = [1]
#   Output: 1
#
# Constraints:
#   1 <= nums.length <= 3 * 104
#   -3 * 104 <= nums[i] <= 3 * 104
#   Each element in the array appears twice except for one element which appears only once.
# 
#########################
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  nums.each { |n| return n if nums.count(n) == 1 }
end
#########################
# Beats 5% Runtime, 91% Memory
# Ruby's Enumberable method #count has a time complexity of O(n) and space complexity of O(1)
#########################
# This is a mathematical way to solve the problem, but Ruby's Enumberable method #uniq
# has time complexity of O(n) but space complexity of O(n) since it's storing another
# Array of the unique values. Similarly, we could use #tally to find the solo value,
# but that also violates the constant extra space request in this problem's description
# since it creates a new Hash. Using #sort also violates time & space complexity constraint.
# Beats 100% Runtime, 39% Memory
# def single_number(nums)
#     (2 * nums.uniq.sum) - nums.sum
# end
#########################
# Ruby can also use a nifty XOR trick, but I've never seen this used irl in my many years of
# developing software and wouldn't expect someone to remember this during an interview.
# Beats 100% Runtime, 91% Memory
# def single_number(nums)
#     nums.inject(&:^)
# end