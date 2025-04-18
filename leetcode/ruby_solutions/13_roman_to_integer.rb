#########################
# 13. Roman to Integer
#
# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
#
# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
#
# For example, 2 is written as II in Roman numeral, just two ones added together.
# 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
#
# Roman numerals are usually written largest to smallest from left to right.
# However, the numeral for four is not IIII. Instead, the number four is written as IV.
# Because the one is before the five we subtract it making four.
# The same principle applies to the number nine, which is written as IX.
# There are six instances where subtraction is used:
#   I can be placed before V (5) and X (10) to make 4 and 9. 
#   X can be placed before L (50) and C (100) to make 40 and 90. 
#   C can be placed before D (500) and M (1000) to make 400 and 900.
#
# Given a roman numeral, convert it to an integer.
#
# Example 1:
#   Input: s = "III"
#   Output: 3
#   Explanation: III = 3.
# Example 2:
#   Input: s = "LVIII"
#   Output: 58
#   Explanation: L = 50, V= 5, III = 3.
# Example 3:
#   Input: s = "MCMXCIV"
#   Output: 1994
#   Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
#
# Constraints:
#   1 <= s.length <= 15
#   s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
#   It is guaranteed that s is a valid roman numeral in the range [1, 3999].
#
#########################
# @param {String} s
# @return {Integer}
def roman_to_int(s)
  int = 0

  (0...s.length).each do |i|
      case s[i]
      when 'I'
          int += 1 * sign(s[i+1], ['V', 'X'])
      when 'V'
          int += 5
      when 'X'
          int += 10 * sign(s[i+1], ['L', 'C'])
      when 'L'
          int += 50
      when 'C'
          int += 100 * sign(s[i+1], ['D', 'M'])
      when 'D'
          int += 500
      when 'M'
          int += 1000
      end
  end

  int
end

def sign(next_char, negs)
  !next_char.nil? && negs.include?(next_char) ? -1 : 1
end
#########################
# Time complexity O(n), Space complexity O(1)
# Beats 62% Runtime, 58% Memory
# This solution is faster than the following because we're only calculating whether
# it's negative or positive for the specific cases which could be negative.
#########################
#
# Iterate over the String s once, looking at each numeral.
# If the current numeral is smaller than the next numeral, then subtract it.
# Otherwise, add it to the result.
def roman_to_int(s)
  values = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000 }
  int = 0

  (0...s.length).each do |i|
    if i == s.length - 1 || values[s[i]] >= values[s[i+1]]
      int += values[s[i]]
    else
      int -= values[s[i]]
    end
  end

  int
end
#########################
# Time complexity O(n), Space complexity O(1)
# Beats 39% Runtime, 58% Memory