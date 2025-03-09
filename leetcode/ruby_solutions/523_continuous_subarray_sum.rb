#########################
# 523. Continuous Subarray Sum
#
# Given an integer array nums and an integer k, return true if nums has a good subarray or false otherwise.
#
# A good subarray is a subarray where:
#   - its length is at least two, and
#   - the sum of the elements of the subarray is a multiple of k.
# Note that:
#   - A subarray is a contiguous part of the array.
#   - An integer x is a multiple of k if there exists an integer n such that x = n * k. 0 is always a multiple of k.
#
###########################
# Performant approach: Iterate over the Array once, calculate the current sum of the
# elements we've seen so far, create a Hash with key-value pairs of the remainder
# and the index of the current number. If the Hash already contains that remainder
# and the distance between the current index and the index we last saw the remainder is > 1,
# then return true because there's a subarray within the numbers we've iterated over
# whose sum is divisible by k.
#
# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def check_subarray_sum(nums, k)
  # Create the remainders Hash with 0 => -1 key-value pair in case the number
  # at index 0 is divisible by k, since that would only be length 1.
  remainders = { 0 => -1 }
  sum = 0
  nums.each_with_index do |num, index|
    sum += num
    remainder = sum % k

    # If it's the first time we've seen this remainder, store it in the remainders Hash
    # { remainder: index_of_current_num }
    if remainders[remainder] == nil
      remainders[remainder] = index
    # If we've seen this remainder already, and the distance between the
    # current index and the index where we last saw that remainder is > 1
    # then return true.
    elsif index - remainders[remainder] > 1
      return true
    end
  end

  return false
end
#########################
# Beats 7% Runtime, 100% Memory

#########################
# Brute force: Try all subarrays of size at least two and return true if there's a
# subarray divisible by k with no remainder or return false if we've reached the end.
# But this solution is slow if the dataset is very large.
#
# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def check_subarray_sum(nums, k)
  # Iterate over each element num1 with its index
  nums.each_with_index do |num1, ind|
    # Return false if the current element is the last in the Array
    return false if ind == nums.length - 1
    # Set a sum value for the sum of the elements in the Array being evaluated
    sum = num1

    # Iterate over each element num2 after the current num1 element
    nums.drop(ind+1).each do |num2|
      # Set the sum of the current subarray
      sum += num2
      # Return true if the sum divided by k has no remainder
      # and is therefore a multiple of k.
      return true if sum % k == 0
    end
  end
end