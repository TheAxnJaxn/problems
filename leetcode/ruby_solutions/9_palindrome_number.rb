#########################
# 9. Palindrome Number
#
# Given an integer x, return true if x is a palindrome, and false otherwise.
#
# Example 1:
#   Input: x = 121
#   Output: true
#   Explanation: 121 reads as 121 from left to right and from right to left.
# Example 2:
#   Input: x = -121
#   Output: false
#   Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
# Example 3:
#   Input: x = 10
#   Output: false
#   Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
#
# Constraints:
#   -231 <= x <= 231 - 1
#
# Follow up: Could you solve it without converting the integer to a string?
#########################
# @param {Integer} x
# @return {Boolean}
# Ruby way to convert to String and compare to the reverse
def is_palindrome(x)
  return false if x < 0

  num = x.to_s
  num == num.reverse
end
#########################
# Beats 100% Runtime, 63% Memory

# Convert to a String then compare from the outermost digits, inward
def is_palindrome2(x)
  s = x.to_s
  left_index = 0
  right_index = s.length - 1

  while left_index < right_index  
    # Return false if they aren't the same character
    return false if s[left_index] != s[right_index]

    # Shift the index pointers
    left_index  += 1
    right_index -= 1
  end

  return true
end
#########################
# Beats 44% Runtime, 32% Memory
