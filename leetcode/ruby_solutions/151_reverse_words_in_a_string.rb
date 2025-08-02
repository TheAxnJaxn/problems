#########################
# 151. Reverse Words in a String
#
# Given an input string s, reverse the order of the words.
#
# A word is defined as a sequence of non-space characters.
# The words in s will be separated by at least one space.
#
# Return a string of the words in reverse order concatenated by a single space.
#
# Note that s may contain leading or trailing spaces or multiple spaces between two words.
# The returned string should only have a single space separating the words.
# Do not include any extra spaces.

# Example 1:
#   Input: s = "the sky is blue"
#   Output: "blue is sky the"
# Example 2:
#   Input: s = "  hello world  "
#   Output: "world hello"
#   Explanation: Your reversed string should not contain leading or trailing spaces.
# Example 3:
#   Input: s = "a good   example"
#   Output: "example good a"
#   Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
#
# Constraints:
#     1 <= s.length <= 104
#     s contains English letters (upper-case and lower-case), digits, and spaces ' '.
#     There is at least one word in s.
#
# Follow-up: If the string data type is mutable in your language,
# can you solve it in-place with O(1) extra space?
#########################
# @param {String} s
# @return {String}
def reverse_words(s)
    # This is the Ruby way to write it, but not what an interviewer wants to see
    s.split(' ').reverse.join(' ')
end
#########################
# Beats 100% Runtime, 57% Memory
#########################
#
# @param {String} s
# @return {String}
def reverse_words(s)
    # Remove all spaces except 1 space between each word
    trim_leading_spaces(s)
    trim_ending_spaces(s)
    trim_extra_spaces(s)

    # From the outside ends of the String to the middle,
    # swap letters in-place. This reverses the String.
    reverse_entire_string(s)

    # Unreverse in-place each individual word of the String.
    unreverse_each_word(s)

    s
end

def trim_leading_spaces(s)
    s[0] = '' while s[0] == ' '
end

def trim_ending_spaces(s)
    s[-1] = '' while s[-1] == ' '
end

def trim_extra_spaces(s)
    i = 0
    j = s.length - 1

    while i < j # trim extra spaces
        s[i+1] = '' while s[i] == ' ' && s[i] == s[i+1]
        i += 1
    end
end

def reverse_entire_string(s)
    i = 0
    j = s.length - 1

    while i < j
        s[i], s[j] = s[j], s[i]
        i += 1
        j -= 1
    end
end

def unreverse_each_word(s)
    word_start_idx = 0
    word_end_idx   = 0
    last_idx       = s.length - 1

    while word_start_idx < last_idx
        # find the last index of the current word
        word_end_idx += 1 while word_end_idx < last_idx && s[word_end_idx + 1] != ' '
        new_start_idx = word_end_idx + 2
        # reverse the word in-place
        while word_start_idx < word_end_idx
            s[word_start_idx], s[word_end_idx] = s[word_end_idx], s[word_start_idx]
            word_start_idx += 1
            word_end_idx -= 1
        end
        # reset indices
        word_start_idx = word_end_idx = new_start_idx
    end
end
#########################
# Beats 5% Runtime, 97% Memory
#########################