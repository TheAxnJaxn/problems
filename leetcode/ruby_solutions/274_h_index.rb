#########################
# 274. H-Index
#
# Given an array of integers citations where citations[i] is the number of citations a
# researcher received for their ith paper, return the researcher's h-index.
#
# According to the definition of h-index on Wikipedia: The h-index is defined as the maximum value of h
# such that the given researcher has published at least h papers that have each been cited at least h times.
#
# Example 1:
#   Input: citations = [3,0,6,1,5]
#   Output: 3
#   Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received
#     3, 0, 6, 1, 5 citations respectively. Since the researcher has 3 papers with at least 3 citations
#     each and the remaining two with no more than 3 citations each, their h-index is 3.
# Example 2:
#   Input: citations = [1,3,1]
#   Output: 1
#
# Constraints:
#   n == citations.length
#   1 <= n <= 5000
#   0 <= citations[i] <= 1000
#########################
# @param {Integer[]} citations
# @return {Integer}
# This is a faster option that sorts the citations Array first in order to iterate from
# smallest to largest citation count and return the h_index once it finds a count of 
# papers that have each been cited at least that many times. Return 0 after if never found.
# e.g. citations [3,0,6,1,5] => [0,1,3,5,6]
def h_index(citations)
    citations.sort!
    length = citations.length

    citations.each_with_index do |cit, idx|
        h_count = length - idx
        return h_count if cit >= h_count
    end

    0
end
#########################
# Beats 100% Runtime, 91% Memory
#########################

