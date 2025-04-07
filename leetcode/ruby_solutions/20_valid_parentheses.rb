#########################
# 20. Valid Parentheses
#
# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
#
# An input string is valid if:
#   Open brackets must be closed by the same type of brackets.
#   Open brackets must be closed in the correct order.
#   Every close bracket has a corresponding open bracket of the same type.
#
# Example 1:
#   Input: s = "()"
#   Output: true
# Example 2:
#   Input: s = "()[]{}"
#   Output: true
# Example 3:
#   Input: s = "(]"
#   Output: false
# Example 4:
#   Input: s = "([])"
#   Output: true
#
# Constraints:
#   1 <= s.length <= 10^4
#   s consists of parentheses only '()[]{}'.
#
#########################
# @param {String} s
# @return {Boolean}
def is_valid(s)
  # Iterate over each character of the String.
  # If it's an open bracket, add to stack.
  # If it's a closed bracket, remove matching opening bracket from the stack;
  #   return false if the next character isn't the correct bracket.
  # Otherwise, return true if the stack is empty at the end.
  stack = []
  pairs = { '(' => ')', '{' => '}', '[' => ']' }

  (0...s.length).each do |i|
    if pairs.keys.include?(s[i])
      stack << s[i]
    else
      open_char = stack.pop
      return false unless pairs[open_char] == s[i]
    end
  end

  stack.empty?
end
#########################
# Beats 79% Runtime, 45% Memory