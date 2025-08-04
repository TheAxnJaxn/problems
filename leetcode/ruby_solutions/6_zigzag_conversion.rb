#########################
# 6. Zigzag Conversion
#
# The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this:
#   P   A   H   N
#   A P L S I I G
#   Y   I   R
# And then read line by line: "PAHNAPLSIIGYIR"
#
# Write the code that will take a string and make this conversion given a number of rows:
#   string convert(string s, int numRows);
#
# Example 1:
#   Input: s = "PAYPALISHIRING", numRows = 3
#   Output: "PAHNAPLSIIGYIR"
# Example 2:
#   Input: s = "PAYPALISHIRING", numRows = 4
#   Output: "PINALSIGYAHRPI"
# Explanation:
#   P     I    N
#   A   L S  I G
#   Y A   H R
#   P     I
# Example 3:
#   Input: s = "A", numRows = 1
#   Output: "A"

# Constraints:
#   1 <= s.length <= 1000
#   s consists of English letters (lower-case and upper-case), ',' and '.'.
#   1 <= numRows <= 1000
#########################
# @param {String} s
# @param {Integer} num_rows
# @return {String}
# Iterate over letters of String s once,
# build an Array of num_rows count Strings with a String of each row,
# then return joined Array of row Strings.
def convert(s, num_rows)
    return s if num_rows == 1

    row_strings  = Array.new(num_rows, '')
    row_tracker  = 0
    row_increase = true

    (0...s.length).each do |i|
        row_strings[row_tracker] += s[i]
        row_tracker += row_increase ? 1 : -1
        
        if row_tracker == num_rows - 1
            row_increase = false
        elsif row_tracker == 0
            row_increase = true
        end
    end

    row_strings.join
end
#########################
# Beats 92% Runtime, 60% Memory
#########################
