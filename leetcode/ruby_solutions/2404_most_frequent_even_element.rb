#########################
# 2404. Most Frequent Even Element
#
#   Given an integer array nums, return the most frequent even element.
#
#   If there is a tie, return the smallest one. If there is no such element, return -1.
#
#   Examples:
#     Input: nums = [0,1,2,2,4,4,1]           Output:  2
#     Input: nums = [4,4,4,9,2,4]             Output:  4
#     Input: nums = [29,47,21,41,13,37,25,7]  Output: -1
#
###########################
  # @param {Integer[]} nums
  # @return {Integer}
  def most_frequent_even(nums)
    counts = {}
    most_frequent_even = -1

    nums.each do |num|
      # Fill the counts Hash with
      # keys of all the even numbers and
      # values of how frequently it appears.
      # e.g. Array nums = [0,1,2,2,4,4,1]
      # results in Hash counts = {0=>1, 2=>2, 4=>2}
      next unless num.even?
      counts[num].nil? ? counts[num] = 1 : counts[num] += 1

      # If this is the first even number we've seen OR
      # the even number is the most frequent OR
      # the even number is equally as frequent and smaller than the tracked even number,
      # then set the most frequent even number to this number.
      if most_frequent_even == -1 ||
        (counts[num] > counts[most_frequent_even]) ||
        (num < most_frequent_even && counts[num] == counts[most_frequent_even])
          most_frequent_even = num
      end
    end

    return most_frequent_even
  end