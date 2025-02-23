# Problem 1 - Multiples of 3 and 5 ####################
#   If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
#   Find the sum of all the multiples of 3 or 5 below 1000.

def problem_1(num)
  accum = 0
  (3...num).each { |check_num| accum += check_num if (check_num % 3 == 0) || (check_num % 5 == 0) }
  accum
end

prob1_num = 1_000
puts "1. #{problem_1(prob1_num)}"