# 125. Valid Palindrome
# A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
#
# Given a string s, return true if it is a palindrome, or false otherwise.
#
# Example 1:
#   Input: s = "A man, a plan, a canal: Panama"
#   Output: true
#   Explanation: "amanaplanacanalpanama" is a palindrome.
# Example 2:
#   Input: s = "race a car"
#   Output: false
#   Explanation: "raceacar" is not a palindrome.
# Example 3:
#   Input: s = " "
#   Output: true
#   Explanation: s is an empty string "" after removing non-alphanumeric characters.
#   Since an empty string reads the same forward and backward, it is a palindrome.
#
# Constraints:
#   1 <= s.length <= 2 * 105
#   s consists only of printable ASCII characters.
#
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  # Set left and right index pointers to the first and last index of the String
  left_index = 0
  right_index = s.length - 1

  while left_index < right_index
      # Skip non-alphanumeric characters
      left_index  += 1 while left_index < right_index && !s[left_index].match?(/[[:alnum:]]/)
      right_index -= 1 while left_index < right_index && !s[right_index].match?(/[[:alnum:]]/)

      # Convert to lowercase and return false if they aren't the same character
      return false if s[left_index].downcase != s[right_index].downcase

      # Shift the index pointers
      left_index  += 1
      right_index -= 1
  end

  return true
end

# If you're not worried about using more memory or modifying the input, this
# is a common Ruby way to strip away unwanted characters, convert to lowercase
# and check if it's a palindrome. Note: standard Ruby styleguides tend to prefer
# predicate method definitions to avoid prefixes like "is_" and to end with a "?"
# if the method returns a Boolean value.
# def palindrome?(s)
#    s.gsub!(/[^[:alnum:]]/, '').downcase!
#    s.reverse == s
# end