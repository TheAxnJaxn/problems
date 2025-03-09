#########################
# 35. Search Insert Position
#
# Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
#
# You must write an algorithm with O(log n) runtime complexity.
#
# Example 1:
#   Input: nums = [1,3,5,6], target = 5
#   Output: 2
# Example 2:
#   Input: nums = [1,3,5,6], target = 2
#   Output: 1
# Example 3:
#   Input: nums = [1,3,5,6], target = 7
#   Output: 4
#
# Constraints:
#   1 <= nums.length <= 104
#   -104 <= nums[i] <= 104
#   nums contains distinct values sorted in ascending order.
#   -104 <= target <= 104
#
#########################
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  # Variables left_index and right_index keep track of the current search range within
  # the sorted Array, starting with the first and last indexes of the Array.
  left_index = 0
  right_index = nums.length - 1

  # While the left index is smaller than or equal to the right index:
  # calculate the middle_index of the current search range of the Array,
  # compare the num at the middle_index to the target,
  # if the number at the middle_index is the target then return that index,
  # elsif the number at the middle_index is larger than the target then move the
  #   right_index to one left of the middle_index to search the left half of the search range next
  # elsif the number at the middle_index is smaller than the target then move the
  #   left_index to one right of the middle_index to search the right half of the search range next.
  while left_index <= right_index
    middle_index = (left_index + right_index) / 2

    if nums[middle_index] == target
      return middle_index
    elsif nums[middle_index] > target
      right_index = middle_index - 1
    elsif nums[middle_index] < target
      left_index = middle_index + 1
    end
  end

  # If the while loop exits without finding the target, return the left_index
  return left_index
end
#########################
# Beats 100% Runtime, 2% memory