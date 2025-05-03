#########################
# 392. Is Subsequence
#
# Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
#
# A subsequence of a string is a new string that is formed from the original string by deleting some (can
# be none) of the characters without disturbing the relative positions of the remaining characters.
# (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
#
# Example 1:
#   Input: s = "abc", t = "ahbgdc"
#   Output: true
# Example 2:
#   Input: s = "axc", t = "ahbgdc"
#   Output: false
#
# Constraints:
# 0 <= s.length <= 100
# 0 <= t.length <= 10^4
# s and t consist only of lowercase English letters.
#
#########################
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  s_index = t_index = 0

  while s_index < s.length && t_index < t.length
      s_index += 1 if s[s_index] == t[t_index]
      t_index += 1
  end

  s_index == s.length
end
#########################
# Time complextiy O(len(t)), Space complexity O(1)
# Beats 88% Runtime, 27% Memory