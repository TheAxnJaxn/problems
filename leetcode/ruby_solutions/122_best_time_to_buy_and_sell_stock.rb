#########################
# 122. Best Time to Buy and Sell Stock
#
# You are given an integer array prices where prices[i] is the price of a given stock on the ith day.
#
# On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the
# stock at any time. However, you can buy it then immediately sell it on the same day.
#
# Find and return the maximum profit you can achieve.
#
# Example 1:
#   Input: prices = [7,1,5,3,6,4]
#   Output: 7
#   Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
#   Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
#   Total profit is 4 + 3 = 7.
# Example 2:
#   Input: prices = [1,2,3,4,5]
#   Output: 4
#   Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
#   Total profit is 4.
# Example 3:
#   Input: prices = [7,6,4,3,1]
#   Output: 0
#   Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.
#
# Constraints:
#   1 <= prices.length <= 3 * 10^4
#   0 <= prices[i] <= 10^4
#########################
# @param {Integer[]} prices
# @return {Integer}
# Store the max profit, running profit and the cost of the stock if bought on the first day.
# Look at days 2 to the end, if the current price is higher than yesterday's price then
# increase the running profit; but otherwise,
def max_profit(prices)
  max = 0
  running_profit = 0
  bought = prices.first

  (1...prices.length).each do |index|
    current = prices[index]

    if current > prices[index-1]
      running_profit = current - bought
    else
      max += running_profit
      running_profit = 0
      bought = current
    end
  end

  max += running_profit
  max
end
#########################
# Time complexity O(N), Space complexity O(1)
# Beats 43% Runtime, 20% Memory
#########################