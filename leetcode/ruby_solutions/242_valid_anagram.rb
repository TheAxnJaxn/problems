#########################
# 242. Valid Anagram
#
# Given two strings s and t, return true if t is an anagram of s, and false otherwise.
#
# Example 1:
#   Input: s = "anagram", t = "nagaram"
#   Output: true
# Example 2:
#   Input: s = "rat", t = "car"
#   Output: false
#
# Constraints:
#   1 <= s.length, t.length <= 5 * 10^4
#   s and t consist of lowercase English letters.
#########################
# @param {String} s
# @param {String} t
# @return {Boolean}
# Most Ruby style guides would instead write this as def anagram?(s, t)
def is_anagram(s, t)
  return false if s.length != t.length
  
  for letter in 'a'..'z'
      return false if s.count(letter) != t.count(letter)
  end

  true
end
#########################
# Beats 100% Runtime, 59% Memory
#########################
def is_anagram2(s, t)
  return false if s.length != t.length

  # Create a hash from String s with the counts of each letter in the String
  s_hash = Hash.new(0)
  s.each_char { |letter| s_hash[letter] += 1 }

  # Iterate over each character of String t and reduce the letter counts from
  # s_hash when seen. The words aren't an anagram if the s_hash doesn't have enough
  # of any one String s letter.
  t.each_char do |letter|
      s_hash[letter] -= 1
      return false if s_hash[letter] < 0
  end

  # The words aren't an anagram if the s_hash has any leftover letters.
  s_hash.each_value { |v| return false if v > 0 }
  true
end
#########################
# Beats 70% Runtime, 100% Memory
# Time complexity O(n), Space complexity O(1)
#########################