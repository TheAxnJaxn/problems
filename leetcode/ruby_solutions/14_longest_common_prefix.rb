#########################
# 14. Longest Common Prefix
#
# Write a function to find the longest common prefix string amongst an array of strings.
#
# If there is no common prefix, return an empty string "".
#
# Example 1:
#   Input: strs = ["flower","flow","flight"]
#   Output: "fl"
# Example 2:
#   Input: strs = ["dog","racecar","car"]
#   Output: ""
#   Explanation: There is no common prefix among the input strings.
#
# Constraints:
#   1 <= strs.length <= 200
#   0 <= strs[i].length <= 200
#   strs[i] consists of only lowercase English letters if it is non-empty.
#
#########################
# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  longest_pre_len = strs.map(&:length).min
  prefix = ''

  (0...longest_pre_len).each do |i|
    letter = nil
    strs.each do |str|
        letter ||= str[i]
        if letter != str[i]
            letter = nil
            break
        end
    end

    break if letter.nil?
    prefix << letter
  end

  prefix
end
#########################
# Time complextiy O(n*m) num strs * length of shortest string, Space complexity O(m) length of shortest string
# Beats 72% Runtime, 85% Memory