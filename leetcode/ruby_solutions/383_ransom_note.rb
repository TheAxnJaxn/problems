#########################
# 383. Ransom Note
# Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
#
# Each letter in magazine can only be used once in ransomNote.
#
# Example 1:
#   Input: ransomNote = "a", magazine = "b"
#   Output: false
#
# Example 2:
#   Input: ransomNote = "aa", magazine = "ab"
#   Output: false
#
# Example 3:
#   Input: ransomNote = "aa", magazine = "aab"
#   Output: true
#
# Constraints:
#   1 <= ransomNote.length, magazine.length <= 105
#   ransomNote and magazine consist of lowercase English letters.
#
#########################
# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
#
# Convert the magazine String into a Hash where the keys are a single letter and
# the values are the count of that letter, then iterate over each letter from the
# ransom_note and return false if the magazine doesn't have enough of that letter,
# reduce the count of that letter by one. Return true outside of that iteration
# since the magazine String could construct the ransom_note String.
def can_construct?(ransom_note, magazine)
  magazine_hash = magazine.chars.tally
  magazine_hash.default = 0

  ransom_note.chars.each do |char|
      return false if magazine_hash[char].zero?
      magazine_hash[char] -= 1
  end

  return true
end
#########################
# Beats 85% Runtime, 35% Memory