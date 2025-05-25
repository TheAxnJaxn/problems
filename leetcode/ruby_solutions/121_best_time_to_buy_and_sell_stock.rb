#########################
# 121. Best Time to Buy and Sell Stock
#
# You are given an array prices where prices[i] is the price of a given stock on the ith day.
#
# You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
#
# Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
#
# Example 1:
#   Input: prices = [7,1,5,3,6,4]
#   Output: 5
#   Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
#   Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
# Example 2:
#   Input: prices = [7,6,4,3,1]
#   Output: 0
#   Explanation: In this case, no transactions are done and the max profit = 0.
#
# Constraints:
#   1 <= prices.length <= 10^5
#   0 <= prices[i] <= 10^4
#########################
#
# Track the maximum profit and minimum price, iterate over the daily prices
# and update the max profit and min price, then return the max profit.
def max_profit(prices)
  max_profit = 0
  min_price = prices.first

  prices.each do |current_price|
    max_profit = [max_profit, current_price - min_price].max
    min_price = [min_price, current_price].min
  end

  max_profit
end
#########################
# Time complexity O(N), Space complexity O(1)
# Beats 76% Runtime, 26% Memory
#
#########################
#
# Use a sliding window and track the max profit found as the window slides.
# If the current buy/sell period results in negative profit, then slide the leftmost
# side of the window closed and keep searching for a better window.
def max_profit2(prices)
    l_idx_buy  = 0
    r_idx_sell = 1
    max_profit = 0

    while r_idx_sell < prices.length
        if prices[l_idx_buy] < prices[r_idx_sell]
            current_profit = prices[r_idx_sell] - prices[l_idx_buy]
            max_profit = [max_profit, current_profit].max
        else
            l_idx_buy = r_idx_sell
        end

        r_idx_sell += 1
    end

    max_profit
end
#########################
# Time complexity O(N), Space complexity O(1)
# Beats 6% Runtime, 26% Memory
#########################