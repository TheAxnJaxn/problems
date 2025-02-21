# Problem 6 - Sum square difference ###############################################
#   The sum of the squares of the first ten natural numbers is
#     1^2 + 2^2 + ... + 10^2 = 385
#   The square of the sum of the first ten natural numbers is
#     (1 + 2 + ... + 10)^2 = 55^2 = 3025
#   Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
#   Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

def problem_6(num)
  sum_of_numbers = sum_of_squares = 0
  (1..num).each do |n|
    sum_of_numbers += n
    sum_of_squares += n**2
  end
  square_of_sum = sum_of_numbers**2

  square_of_sum - sum_of_squares
end

prob6_num = 100
puts "6. #{problem_6(prob6_num)}"