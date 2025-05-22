#########################
# 80. Remove Duplicates from Sorted Array II
#
# Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element
# appears at most twice. The relative order of the elements should be kept the same.
#
# Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in
# the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first
# k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.
#
# Return k after placing the final result in the first k slots of nums.
#
# Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
#
# Example 1:
#   Input: nums = [1,1,1,2,2,3]
#   Output: 5, nums = [1,1,2,2,3,_]
#   Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
#   It does not matter what you leave beyond the returned k (hence they are underscores).
# Example 2:
#   Input: nums = [0,0,1,1,1,1,2,3,3]
#   Output: 7, nums = [0,0,1,1,2,3,3,_,_]
#   Explanation: Your function should return k = 7, with the first seven elements of nums being 0, 0, 1, 1, 2, 3 and 3 respectively.
#   It does not matter what you leave beyond the returned k (hence they are underscores).
#
# Constraints:
#   1 <= nums.length <= 3 * 10^4
#   -10^4 <= nums[i] <= 10^4
#   nums is sorted in non-decreasing order.
#########################
# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    return nums.length if nums.length < 3

    # Track the index of the last saved unique num (which may appear at most twice.)
    idx_uniq = 1

    # Iterate over the nums Array once.
    # Keep numbers at the first two indices by skipping over them.
    # For remaining nums: if the current num doesn't equal the last known saved
    # num OR the current num equals the last known saved num and is the first dup,
    # then increase idx_uniq, and move the num to that index as the last saved unique num.
    nums.each_with_index do |num, num_i|
        next if num_i == 0 || num_i == 1

        if (num != nums[idx_uniq]) || (num == nums[idx_uniq] && num != nums[idx_uniq - 1])
            idx_uniq += 1
            nums[idx_uniq] = num
        end
    end

    idx_uniq + 1
end

#########################
# Time complexity O(N), Space complexity O(1)
# Beats 70% Runtime, 64% Memory