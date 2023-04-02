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

# Problem 2 - Even Fibonacci numbers ##########################################
#   Recursive solution, which I had to abandon because it causes a stack
#   level too deep when the upper_limit is too high (like 4_000_000)
#
#   def problem_2_build_fib_array(upper_limit)
#     return [1,2] if upper_limit == 2
#     fib_array = problem_2_build_fib_array(upper_limit - 1)
#     next_potential_num = fib_array[-1] + fib_array[-2]
#     fib_array << next_potential_num if next_potential_num < upper_limit
#     fib_array
#   end

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
puts "2. #{problem_2(prob2_num)}"

# Problem 3 - Largest Prime Factor ############################################
#   The prime factors of 13195 are 5, 7, 13 and 29.
#
#   What is the largest prime factor of the number 600851475143 ?
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
puts "3. #{problem_3(prob3_num)}"

# Problem 4 - Largest Palindrome Factor #######################################
#   A palindromic number reads the same both ways.
#   Find the largest palindrome made from the product of two 3-digit numbers.

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

puts "4. #{problem_4}"

# Problem 5 - Smallest multiple ###############################################
#   2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
#   What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

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

puts "5. #{problem_5(2, 20)}"

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

# Problem 7 - 10001st prime ###############################################
#   By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#   What is the 10_001st prime number?

# Straightforward would be: check each number from 2 up, check if it's a prime, then output the [num]th prime,
# but that is too inefficient and Project Euler wants every problem to take < 60 seconds.
# Facts about primes that'll make this more efficient by cutting down the search space:
#   2 is the only even prime
#   All primes > 3 are prime = 6n -+ 1
#   The only numbers that satisfy 6n -+ 1 but still aren't primes are divisible by a smaller prime number.
def divisible_by_prime?(possible_prime, known_primes)
  known_primes.each do |prime|
    return true if possible_prime % prime == 0
  end

  false
end

def problem_7(num)
  known_primes = [2, 3]
  n = 1

  while known_primes.length < num
    [6 * n - 1, 6 * n + 1].each do |possible_prime|
      known_primes << possible_prime unless divisible_by_prime?(possible_prime, known_primes)
    end
    n += 1
  end

  known_primes[num-1]
end

prob7_num = 10_001
puts "7. #{problem_7(prob7_num)}"

# Problem 8 - Largest product in a series ###############################################
#   The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.
#     [1000-digit number omitted]
#   Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?

def problem_8(adjacent)
  digits = <<~DIGITS
    73167176531330624919225119674426574742355349194934
    96983520312774506326239578318016984801869478851843
    85861560789112949495459501737958331952853208805511
    12540698747158523863050715693290963295227443043557
    66896648950445244523161731856403098711121722383113
    62229893423380308135336276614282806444486645238749
    30358907296290491560440772390713810515859307960866
    70172427121883998797908792274921901699720888093776
    65727333001053367881220235421809751254540594752243
    52584907711670556013604839586446706324415722155397
    53697817977846174064955149290862569321978468622482
    83972241375657056057490261407972968652414535100474
    82166370484403199890008895243450658541227588666881
    16427171479924442928230863465674813919123162824586
    17866458359124566529476545682848912883142607690042
    24219022671055626321111109370544217506941658960408
    07198403850962455444362981230987879927244284909188
    84580156166097919133875499200524063689912560717606
    05886116467109405077541002256983155200055935729725
    71636269561882670428252483600823257530420752963450
  DIGITS
  largest_product = 0
  digits_array = digits.gsub(/\s+/, "").split("").map(&:to_i)

  start_index = 0
  while start_index < digits_array.length - adjacent
    subarray = digits_array.slice(start_index, adjacent)
    product = subarray.inject(:*)
    largest_product = [product, largest_product].max
    start_index += 1
  end
  largest_product
end

prob8_num = 13
puts "8. #{problem_8(prob8_num)}"
