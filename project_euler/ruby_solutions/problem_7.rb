# Problem 7 - 10001st prime ###############################################
#   By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#   What is the 10_001st prime number?

# Straightforward would be: check each number from 2 up, check if it's a prime, then output the [num]th prime,
# but that is too inefficient and Project Euler wants every problem to take < 60 seconds.
# Facts about primes that'll make this more efficient by cutting down the search space:
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