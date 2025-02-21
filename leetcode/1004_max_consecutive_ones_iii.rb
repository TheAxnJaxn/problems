#########################
# 1004. Max Consecutive Ones III
#
#   Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.
#
#   Example:
#     Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
#     Output: 10
#     Explanation:  [0,0,1,1,X,X,1,1,1,X,1,1,0,0,0,1,1,1,1]
#     Numbers were flipped from 0 to X to show the longest subarray.
#
#   Constraints:
#     1 <= nums.length <= 105
#     nums[i] is either 0 or 1
#     0 <= k <= nums.length
#
###########################
  # @param {Integer[]} nums
  # @param {Integer} k
  # @return {Integer}
  def longest_ones(nums, k)
      # Return a helpful String if an error check fails
      return "nums Array isn't the correct length" unless 1 <= nums.length && nums.length <= 10**5
      return "nums Array must only contain 0s and 1s" unless nums.all? { |el| el == 0 || el == 1 }
      return "k Int must be 0 or larger and less than the length of nums Array" unless 0 <= k && k <= nums.length

      # Keep track of the max consecutive length found, a start_index and end_index of the current sub-Array
      # being assessed, and the number of flipped zeroes of the current sub-Array being assessed. Increment
      # the end_index by one while passing through the Array once by using each_with_index.
      # Check the Integer at the end_index. If it's 0, increment the number of flipped zeroes by one.
      # If the number of flipped zeroes is now greater than the number of allowed flips (k), adjust the
      # start_index until we have the max allowable flipped_zeroes within the current sub-Array being assessed.
      # Update the max consecutive length if we've found a new max consecutive length.
      max_consecutive = start_index = flipped_zeroes = 0

      nums.each_with_index do |num, end_index|
          if num == 0
              flipped_zeroes += 1

              while flipped_zeroes > k
                  if nums[start_index] == 0
                      flipped_zeroes -= 1
                  end
                  start_index += 1
              end
          end

          current_consecutive = end_index - start_index + 1
          max_consecutive = [max_consecutive, current_consecutive].max
      end

      return max_consecutive
  end