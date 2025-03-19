#########################
# 15. 3Sum
#
# Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
#
# Notice that the solution set must not contain duplicate triplets.
#
# Example 1:
#   Input: nums = [-1,0,1,2,-1,-4]
#   Output: [[-1,-1,2],[-1,0,1]]
#   Explanation: 
#   nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
#   nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
#   nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
#   The distinct triplets are [-1,0,1] and [-1,-1,2].
#   Notice that the order of the output and the order of the triplets does not matter.
# Example 2:
#   Input: nums = [0,1,1]
#   Output: []
#   Explanation: The only possible triplet does not sum up to 0.
# Example 3:
#   Input: nums = [0,0,0]
#   Output: [[0,0,0]]
#   Explanation: The only possible triplet sums up to 0.
#
# Constraints:
#   3 <= nums.length <= 3000
#   -10^5 <= nums[i] <= 10^5
#
#########################
# @param {Integer[]} nums
# @return {Integer[][]}

# Avoiding duplicate triplets when there will be duplicated numbers in the Array is the trickiest part.
# Start by creating an empty Array to store the results and sort the nums Array. Iterate over the
# sorted nums Array once, skipping any duplicate numbers, set a left and right index to the index of
# the first and last numbers in the remaining numbers of the Array, check the sum of those three nums,
# move the left/right index accordingly and avoid duplicates. Return the triplets.
def three_sum(nums)
  triplets = []
  nums.sort!

  nums.each_with_index do |num, index|
    # Skip this number if it's a duplicate of the previous number in this sorted Array,
    # since I'll find all triplets that include num and need to avoid duplicated triplets.
    next if index > 0 && num == nums[index - 1]

    left, right = index + 1, nums.length - 1

    while left < right
      three_sum = num + nums[left] + nums[right]

      if three_sum == 0
        triplets << [num, nums[left], nums[right]]
        # Keep moving the left index until it hasn't found a duplicate number.
        left += 1
        left += 1 while nums[left] == nums[left - 1] && left < right
      elsif three_sum > 0
        right -= 1
      elsif three_sum < 0
        left += 1
      end
    end
  end

  triplets
end
#########################
# Beats 56% Runtime, 48% Memory
# Time Complexity O(n^2), Space Complexity O(n) due to Ruby #sort!