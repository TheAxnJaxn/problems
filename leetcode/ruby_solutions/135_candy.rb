#########################
# 135. Candy
#
# There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.
#
# You are giving candies to these children subjected to the following requirements:
#
# Each child must have at least one candy.
# Children with a higher rating get more candies than their neighbors.
# Return the minimum number of candies you need to have to distribute the candies to the children.
#
# Example 1:
#   Input: ratings = [1,0,2]
#   Output: 5
#   Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
# Example 2:
#  Input: ratings = [1,2,2]
#   Output: 4
#   Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
#   The third child gets 1 candy because it satisfies the above two conditions.
#
# Constraints:
#   n == ratings.length
#   1 <= n <= 2 * 104
#   0 <= ratings[i] <= 2 * 104
#########################
# @param {Integer[]} ratings
# @return {Integer}
def candy(ratings)
  # Array to track the candy count for each child, default 1 to start
  candy = Array.new(ratings.length, 1)

  # Traverse ratings Array from L -> R, comparing to child on their left
  (1...ratings.length).each do |index|
      if ratings[index] > ratings[index - 1]
          candy[index] = candy[index - 1] + 1
      end
  end

  # Traverse ratings Array from R -> L, comparing to child on their right
  (0...ratings.length-1).reverse_each do |index|
      if ratings[index] > ratings[index + 1]
          candy[index] = [candy[index], candy[index + 1] + 1].max
      end
  end

  # Return the sum of the candy count for each child
  candy.sum
end
#########################
# Time complexity O(n), Space complexity O(n)
# Beats 49% Runtime, 17% Memory