#########################
# 169. Majority Element
#
# Given an array nums of size n, return the majority element.
#
# The majority element is the element that appears more than ⌊n / 2⌋ times.
# You may assume that the majority element always exists in the array.
#
# Example 1:
#   Input: nums = [3,2,3]
#   Output: 3
# Example 2:
#   Input: nums = [2,2,1,1,1,2,2]
#   Output: 2

# Constraints:
#   n == nums.length
#   1 <= n <= 5 * 10^4
#   -10^9 <= nums[i] <= 10^9
#########################
# @param {Integer[]} nums
# @return {Integer}
# For every one majority_element, there will be one element of a different value,
# and still have at least one unpaired majority_element. We can pair them up by
# storing an element and that element's count, increasing the count if we see more
# of it or decreasing the count if we see a different number. Store the new element
# to count anytime the count hits zero, including at the start of the iteration.
def majority_element(nums)
    element = nil
    element_count = 0

    nums.each do |num|
        if element_count.zero?
            element = num
            element_count = 1
        elsif num == element
            element_count += 1
        else
            element_count -= 1
        end
    end

    element
end

#########################
# Time complexity O(N), Space complexity O(1)
# Beats 70% Runtime, 97% Memory