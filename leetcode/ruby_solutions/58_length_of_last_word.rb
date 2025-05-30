#########################
# 58. Length of Last Word
#
# Given a string s consisting of words and spaces, return the length of the last word in the string.
#
# A word is a maximal substring consisting of non-space characters only.
#
# Example 1:
#   Input: s = "Hello World"
#   Output: 5
#   Explanation: The last word is "World" with length 5.
# Example 2:
#   Input: s = "   fly me   to   the moon  "
#   Output: 4
#   Explanation: The last word is "moon" with length 4.
# Example 3:
#   Input: s = "luffy is still joyboy"
#   Output: 6
#   Explanation: The last word is "joyboy" with length 6.
#
# Constraints:
#   1 <= s.length <= 10^4
#   s consists of only English letters and spaces ' '.
#   There will be at least one word in s.
#########################
# @param {String} s
# @return {Integer}
# Iterate over the String s backwards and return the length of the last word.
# This speeds things up since you won't need to iterate over the entire String s.
def length_of_last_word(s)
    word_length = 0
    
    (s.length-1).downto(0).each do |i|
        if s[i] != ' '
            word_length += 1
        elsif s[i] == ' ' && word_length > 0
            return word_length
        end
    end

    word_length
end
#########################
# Time complexity O(N), Space complexity O(1)
# Beats 100% Runtime, 92% Memory
#########################

def length_of_last_word_ruby_way(s)
    s.split(' ').last.length
end
#########################
# Time complexity O(N), Space complexity O(N)
# Beats 100% Runtime, 34% Memory
#########################