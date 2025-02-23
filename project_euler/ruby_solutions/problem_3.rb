# Problem 3 - Largest Prime Factor ############################################
#   The prime factors of 13195 are 5, 7, 13 and 29.
#
#   What is the largest prime factor of the number 600851475143 ?
#
#   Straightforward: check each number from largest to smallest and return if that num
#   is both a factor and a prime but that's very inefficient for a large number.
#   Facts that'll help efficiency:
#     All primes > 3 are prime = 6n -+ 1
#     The only numbers that satisfy 6n -+ 1 but still aren't primes are divisible by a smaller prime number.
#   Generate known primes, keeping track of the largest prime factor
def factor?(num, possible_factor)
  num % possible_factor == 0
end

def divisible_by_smaller_prime?(possible_prime, known_primes)
  known_primes.each do |prime|
    return true if possible_prime % prime == 0
  end

  false
end

def problem_3(num)
  known_primes = [2, 3]
  largest_prime_factor = 2 if factor?(num, 2)
  largest_prime_factor = 3 if factor?(num, 3)
  n = 1

  while known_primes.last < num
    [6 * n - 1, 6 * n + 1].each do |possible_prime|
      if !divisible_by_smaller_prime?(possible_prime, known_primes)
        known_primes << possible_prime
        largest_prime_factor = possible_prime if factor?(num, possible_prime)
      end
    end
    n += 1
  end

  largest_prime_factor
end

prob3_num = 600_851_475_143
puts "3. #{problem_3(prob3_num)}"