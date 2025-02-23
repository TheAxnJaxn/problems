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