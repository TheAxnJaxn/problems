# Problem 1 - Multiples of 3 and 5 ####################
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

def problem_1(num)
  accum = 0
  (3...num).each { |check_num| accum += check_num if (check_num % 3 == 0) || (check_num % 5 == 0) }
  accum
end

prob1_num = 1_000
puts "1. The sum of multiples of 3 or 5 below #{prob1_num} is: #{problem_1(prob1_num)}"

# Problem 2 - Even Fibonacci numbers ##########################################

# Recursive solution, which I had to abandon because it causes a stack
# level too deep when the upper_limit is too high (like 4_000_000)
#
# def problem_2_build_fib_array(upper_limit)
#   return [1,2] if upper_limit == 2
#   fib_array = problem_2_build_fib_array(upper_limit - 1)
#   next_potential_num = fib_array[-1] + fib_array[-2]
#   fib_array << next_potential_num if next_potential_num < upper_limit
#   fib_array
# end

def problem_2_build_fib_array(upper_limit)
  fib_array = [1,2]
  while fib_array.last < upper_limit
    next_fib = fib_array[-1] + fib_array[-2]
    fib_array << next_fib
  end
  fib_array.pop
  fib_array
end

def problem_2(num)
  fib_sequence = problem_2_build_fib_array(num)
  fib_sequence.select! { |num| num.even? }
  fib_sequence.inject(:+)
end

prob2_num = 4_000_000
puts "2. The sum of even-valued Fibonacci terms below #{prob2_num} is: #{problem_2(prob2_num)}"

# Problem 3 - Largest Prime Factor ############################################
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?
def factor?(num, denominator)
  num % denominator == 0
end

def prime?(num)
  denominator = 2
  while denominator <= num/2
    return false if num % denominator == 0
    denominator += 1
  end
  true
end

def problem_3(num)
  # Iterate from num/2 to 2, check if current integer is a factor and a
  # prime, then return at the first integer when both are true.
  largest = num/2

  while largest >= 2
    return largest if factor?(num, largest) && prime?(largest)

    largest -= 1
  end
end

prob3_num = 600_851_475_143
puts "3. The largest prime factor of the number #{prob3_num} is: #{problem_3(prob3_num)}"

# Problem 4 - Largest Palindrome Factor #######################################
# A palindromic number reads the same both ways.
# Find the largest palindrome made from the product of two 3-digit numbers.

def problem_4
  num1 = 999
  largest_pal = 0

  while num1 > 99
    num2 = num1 - 1
    while num2 > 99
      product = num1 * num2
      if is_palindrome?(product) && product > largest_pal
        largest_pal = product
      end
      num2 -= 1
    end
    num1 -= 1
  end

  return largest_pal
end

def is_palindrome?(num)
  str = num.to_s
  return str == str.reverse
end

puts "4. The largest palindromic product of two 3-digit numbers is: #{problem_4}"

# Problem 5 - Smallest multiple ###############################################
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def problem_5(lower_limit, upper_limit)
  searching = true
  numerator = upper_limit
  while searching == true
    numerator += 2
    searching = false
    (lower_limit..upper_limit).each do |denominator|
      searching = true unless numerator % denominator == 0
    end
  end
  return numerator
end

puts "5. The smallest number evenly divisible by 1 to 20 is: #{problem_5(2, 20)}"

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
puts "6. The difference between the sum of the squares of the first #{prob6_num} natural numbers and the square of the sum is: #{problem_6(prob6_num)}"
