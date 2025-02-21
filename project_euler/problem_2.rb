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