#########################
# 67. Add Binary
#
# Given two binary strings a and b, return their sum as a binary string.
#
# Example 1:
#   Input: a = "11", b = "1"
#   Output: "100"
# Example 2:
#   Input: a = "1010", b = "1011"
#   Output: "10101"
#
# Constraints:
#   1 <= a.length, b.length <= 10^4
#   a and b consist only of '0' or '1' characters.
#   Each string does not contain leading zeros except for the zero itself.
#
#########################
#
# I'm adding more explanation here than usual because I needed to relearn what it means to sum binary strings.
# Like regular addition, we add the rightmost digits and carry over any additional to the digit directly to the left.
# Binary can only ever be '0' or '1', so 0+0=0, 0+1=1, 1+1=10 since the carry amount moves left.
#
# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  carry, sum = 0, ''
  a_i = a.length - 1
  b_i = b.length - 1

  while a_i >= 0 || b_i >= 0 || carry > 0
    if a_i >= 0
      carry += a[a_i].to_i
      a_i -= 1
    end

    if b_i >= 0
      carry += b[b_i].to_i
      b_i -= 1
    end

    sum.prepend((carry % 2).to_s)
    carry /= 2
  end

  sum
end
#########################
# Time complextiy O(n), Space complexity O(1)
# Beats 100% Runtime, 39% Memory