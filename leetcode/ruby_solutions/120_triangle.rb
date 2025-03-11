#########################
# 120. Triangle
#
# Given a triangle array, return the minimum path sum from top to bottom.
#
# For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.
#
# Example 1:
#   Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
#   Output: 11
#   Explanation: The triangle looks like:
#      2
#     3 4
#    6 5 7
#   4 1 8 3
# The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).
#
# Example 2:
#   Input: triangle = [[-10]]
#   Output: -10
#
# Constraints:
#   1 <= triangle.length <= 200
#   triangle[0].length == 1
#   triangle[i].length == triangle[i - 1].length + 1
#   -104 <= triangle[i][j] <= 104
#########################
# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
  # Use a copy of the triangle's bottom row to start tracking minimum sum from each bottom-up path
  sums = triangle.last.dup

  # Traverse the triangle Array from the bottom up, so start with the last row
  (triangle.size - 2).downto(0) do |row|
    (0...triangle[row].size).each do |col|
      sums[col] = triangle[row][col] + [sums[col], sums[col + 1]].min
    end
  end

  sums.first
end
#########################
# Beats 79% Runtime, 84% Memory