#########################
# 167. Two Sum II - Input Array is Sorted
#
# Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.
#
# Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.
#
# The tests are generated such that there is exactly one solution. You may not use the same element twice.
#
# Your solution must use only constant extra space.
#
# Example 1:
#   Input: numbers = [2,7,11,15], target = 9
#   Output: [1,2]
#   Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
# Example 2:
#   Input: numbers = [2,3,4], target = 6
#   Output: [1,3]
#   Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
# Example 3:
#   Input: numbers = [-1,0], target = -1
#   Output: [1,2]
#   Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].
#
# Constraints:
#   2 <= numbers.length <= 3 * 10^4
#   -1000 <= numbers[i] <= 1000
#   numbers is sorted in non-decreasing order.
#   -1000 <= target <= 1000
#   The tests are generated such that there is exactly one solution.
#########################
# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}

# Build a hash from the numbers Array, where the number is the key and the index is the value,
# and check if the Hash already has a key that could add to the current number to equal target.
def two_sum(numbers, target)
  num_i = {}

  numbers.each_with_index do |n, i|
      return [num_i[target - n] + 1, i + 1] if num_i.key?(target - n)
      num_i[n] = i
  end
end
#########################
# Beats 100% Runtime, 53% Memory
# O(n) Time Complexity, O(n) Space Complexity
#########################

# Remembering that the Array is sorted and we're guaranteed exactly one solution,
# store two index pointers for the first and last elements of the Array, add those
# two elements together, and either return the solution or move the appropriate pointer.
def two_sum2(numbers, target)
  left = 0
  right = numbers.length - 1

  while left < right
    sum = numbers[left] + numbers[right]

    if sum == target
      return [left + 1, right + 1]
    elsif sum > target
      right -= 1
    elsif sum < target
      left += 1
    end
  end
end
#########################
# Beats 89% Runtime, 13% Memory
# O(n) Time Complexity, O(1) Space Complexity
#########################