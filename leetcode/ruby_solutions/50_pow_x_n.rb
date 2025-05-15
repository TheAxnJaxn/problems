#########################
# 50. Pow(x, n)
#
# Implement pow(x, n), which calculates x raised to the power n (i.e., xn).
#
# Example 1:
#   Input: x = 2.00000, n = 10
#   Output: 1024.00000
# Example 2:
#   Input: x = 2.10000, n = 3
#   Output: 9.26100
# Example 3:
#   Input: x = 2.00000, n = -2
#   Output: 0.25000
#   Explanation: 2^-2 = 1/2^2 = 1/4 = 0.25
#
# Constraints:
#   -100.0 < x < 100.0
#   -2^31 <= n <= 2^31 - 1
#   n is an integer.
#   Either x is not zero or n > 0.
#   -10^4 <= x^n <= 10^4
#
#########################
# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return 1 if n == 0
  return x if n == 1

  result = power(x, n.abs)

  n > 0 ? result : 1/result
end

def power(x, n)
  return 1 if n == 0
  return x if n == 1

  result = power(x, n/2)

  if n.odd?
      result * result * x
  else
      result * result
  end
end
#########################
# Time complextiy O(LogN), Space complexity O(LogN)
# Beats 100% Runtime, 99% Memory