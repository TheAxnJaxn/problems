#########################
# 66. Plus One
#
# You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
#
# Increment the large integer by one and return the resulting array of digits.
#
# Example 1:
#   Input: digits = [1,2,3]
#   Output: [1,2,4]
#   Explanation: The array represents the integer 123.
#     Incrementing by one gives 123 + 1 = 124.
#     Thus, the result should be [1,2,4].
# Example 2:
#   Input: digits = [4,3,2,1]
#   Output: [4,3,2,2]
#   Explanation: The array represents the integer 4321.
#     Incrementing by one gives 4321 + 1 = 4322.
#     Thus, the result should be [4,3,2,2].
# Example 3:
#   Input: digits = [9]
#   Output: [1,0]
#   Explanation: The array represents the integer 9.
#     Incrementing by one gives 9 + 1 = 10.
#     Thus, the result should be [1,0].
#
# Constraints:
#   1 <= digits.length <= 100
#   0 <= digits[i] <= 9
#   digits does not contain any leading 0's.
#
#########################
# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  index = digits.length - 1

  if digits[index] < 9
    digits[index] += 1
  else
    # while the current digit is 9: set it to 0, move the index left.
    # Break out of the loop and add a 1 to the front of digits if all digits were 9.
    # Break out of the loop and add 1 to the current digit if it's less than 9.
    while digits[index] == 9
      digits[index] = 0
      index -= 1

      break digits.unshift(1) if index < 0
      break digits[index] += 1 if digits[index] < 9
    end
  end

  return digits
end
#########################
# Beats 100% Runtime, 91% Memory

#########################
# This is readable, short Ruby way of doing this, but it's not as efficient.
def plus_one2(digits)
  digits.join.to_i.next.digits.reverse
end
#########################
# Beats 100% Runtime, 82% Memory
