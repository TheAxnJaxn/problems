#########################
# 70. Climbing Stairs
#
# You are climbing a staircase. It takes n steps to reach the top.
#
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
#
# Example 1:
#   Input: n = 2
#   Output: 2
#   Explanation: There are two ways to climb to the top.
#   1. 1 step + 1 step
#   2. 2 steps
# Example 2:
#   Input: n = 3
#   Output: 3
#   Explanation: There are three ways to climb to the top.
#   1. 1 step + 1 step + 1 step
#   2. 1 step + 2 steps
#   3. 2 steps + 1 step
#
# Constraints:
#   1 <= n <= 45
#
#########################
# @param {Integer} n
# @return {Integer}
# n => distinct { 1 => 1, 2 => 2, 3 => 3, 4 => 5, 5 => 8, ... }
# This is a Fibonacci sequence, which can be built by tracking the current
# number of distinct ways to climb and the previous number of distinct ways to climb,
# which is set up for the first few n steps then can build on itself.
def climb_stairs(n)
  return n if n < 4
  prev, distinct = 1, 2

  (3..n).each do |step|
    distinct += prev
    prev = distinct - prev
  end

  distinct
end
#########################
# Time Complextiy O(n), Space complexity O(1)
# Beats 100% Runtime, 67% Memory
