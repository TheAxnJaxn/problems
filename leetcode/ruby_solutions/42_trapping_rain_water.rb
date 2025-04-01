#########################
# 42. Trapping Rain Water
#
# Given n non-negative integers representing an elevation map where the width of each bar is 1,
# compute how much water it can trap after raining.
#
# Example 1:
#   Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
#   Output: 6
#   3 |                            ___
#   2 |            ___            |   |___     ___
#   1 |    ___    |   |_~_  ~  _~_|       |_~_|   |___
#   0 | _ | _ | ~ | _   _ | ~ | _   _   _   _   _   _ |
#   i   0   1   2   3   4   5   6   7   8   9   10  11
#   Explanation: The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1].
#   In this case, 6 units of rain water (~) are being trapped.
# Example 2:
#   Input: height = [4,2,0,3,2,5]
#   Output: 9
#
# Constraints:
#   n == height.length
#   1 <= n <= 2 * 10^4
#   0 <= height[i] <= 10^5
#
#########################
# @param {Integer[]} height
# @return {Integer}
def trap(height)
  return 0 if height.length < 3
  l, r = 0, height.length - 1
  l_max, r_max = height[l], height[r]
  water = 0

  while l < r
      if l_max < r_max
          l += 1
          l_max = [l_max, height[l]].max
          water += l_max - height[l]
      else
          r -= 1
          r_max = [r_max, height[r]].max
          water += r_max - height[r]
      end
  end

  water
end
#########################
# Time complexity O(n), Space complexity O(1)
# Beats 73% Runtime, 69% Memory