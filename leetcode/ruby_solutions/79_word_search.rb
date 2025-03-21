#########################
# 79. Word Search
#
# Given an m x n grid of characters board and a string word, return true if word exists in the grid.
#
# The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.
#
# Example 1:
#   Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
#   Output: true
#   Board Visualization:
#     A B C E     A B C _
#     S F C S     _ _ C _
#     A D E E     _ D E _
# Example 2:
#   Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
#   Output: true
# Example 3:
#   Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
#   Output: false
#
# Constraints:
#   m == board.length
#   n = board[i].length
#   1 <= m, n <= 6
#   1 <= word.length <= 15
#   board and word consists of only lowercase and uppercase English letters.
#
#########################
# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  board_set = board.flatten.to_set
  word_set = word.chars.to_set
  return false unless word_set.subset?(board_set)

  @board, @word = board, word

  (0...board.length).each do |row_i|
      (0...board[0].length).each do |col_i|
          return true if word_found?(row_i, col_i, 0)
      end
  end

  false
end

def word_found?(row_i, col_i, word_char_i)
  # if the count of letters found == word.length, we've found the entire word
  # return true
  return true if word_char_i == @word.length

  # if the current cell doesn't exist on the board OR
  #   the current cell doesn't have the word char we're looking for
  # return false
  if !coordinate_on_board?(row_i, col_i) || @board[row_i][col_i] != @word[word_char_i]
      return false
  end

  # temporarily remove the found letter, keep searching for the next
  # word char nearby, then reset the visited letter
  letter = @board[row_i][col_i]
  @board[row_i][col_i] = ""
  found = word_found?(row_i + 1, col_i,     word_char_i + 1) ||
          word_found?(row_i - 1, col_i,     word_char_i + 1) ||
          word_found?(row_i,     col_i + 1, word_char_i + 1) ||
          word_found?(row_i,     col_i - 1, word_char_i + 1)
  @board[row_i][col_i] = letter
  return found
end

def coordinate_on_board?(row_i, col_i)
  row_i >=0 && row_i < @board.length && col_i >= 0 && col_i < @board[0].length
end
#########################
# Beats 89% Runtime, 40% Memory