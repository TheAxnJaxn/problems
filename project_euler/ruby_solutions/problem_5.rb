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