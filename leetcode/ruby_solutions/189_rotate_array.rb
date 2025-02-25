#########################
# 189. Rotate Array
# Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.
#
# Example 1:
#
# Input: nums = [1,2,3,4,5,6,7], k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
#   rotate 1 steps to the right: [7,1,2,3,4,5,6]
#   rotate 2 steps to the right: [6,7,1,2,3,4,5]
#   rotate 3 steps to the right: [5,6,7,1,2,3,4]
#
# Example 2:
#
# Input: nums = [-1,-100,3,99], k = 2
# Output: [3,99,-1,-100]
# Explanation: 
#   rotate 1 steps to the right: [99,-1,-100,3]
#   rotate 2 steps to the right: [3,99,-1,-100]
#
# Constraints:
#   1 <= nums.length <= 105
#   -231 <= nums[i] <= 231 - 1
#   0 <= k <= 105
#
# Follow up:
#
# Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
# Could you do it in-place with O(1) extra space?
#
#########################
# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
# Create a new Array, iterate over the existing Array nums,
# set the new index for each element (account for wrapping),
# set the original nums Array to the rotated version.
def rotate(nums, k)
  rotated = Array.new(nums.length)

  nums.each_with_index do |num, index|
      new_index = (index + nums.length + k) % nums.length
      rotated[new_index] = num
  end

  nums.replace(rotated)
end

# Verify the shift amount k is smaller than the Array length,
# use Array#pop to take the last k elements off the end of the Array,
# use Array#prepend and #flatten! to move those elements to the front
# of the nums Array.
def rotate2(nums, k)
    k = k % nums.length
    front_nums = nums.pop(k)
    nums.prepend(front_nums).flatten!
end

# Ruby Array has a #rotate! method that rotates the Array in the opposite
# direction from this problem, so input negative k for the desired rotation.
def rotate3(nums, k)
    k = k % nums.length
    nums.rotate!(-k)
end
