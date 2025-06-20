#########################
# 238. Product of Array Except Self
#
# Given an integer array nums, return an array answer such that answer[i]
# is equal to the product of all the elements of nums except nums[i].
#
# The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
#
# You must write an algorithm that runs in O(n) time and without using the division operation.
#
# Example 1:
#   Input: nums = [1,2,3,4]
#   Output: [24,12,8,6]
# Example 2:
#   Input: nums = [-1,1,0,-3,3]
#   Output: [0,0,9,0,0]
# Example 3: * This is a test case I added to verify the expected value
#   Input: nums = [0,1,0,3]
#   Output: [0,0,0,0]
#
# Constraints:
#   2 <= nums.length <= 105
#   -30 <= nums[i] <= 30
#   The input is generated such that answer[i] is guaranteed to fit in a 32-bit integer.
#########################
# @param {Integer[]} nums
# @return {Integer[]}
# Iterate once to get the product of all nums.
# Iterate a second time to build the answer Array division product/num.
# Edge case: must account for 0 in nums.
def product_except_self(nums)
    product, zero_count, answers = 1, 0, []

    nums.each do |num|
        num.zero? ? zero_count+=1 : product*=num
    end

    nums.each do |num|
        if zero_count.zero?
            answer =  product/num
        elsif zero_count == 1
            answer = num.zero? ? product : 0
        elsif zero_count > 1
            answer = 0
        end
        
        answers.push(answer)
    end

    answers
end
#########################
# Beats 74% Runtime, 53% Memory
#########################