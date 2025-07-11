#########################
# 295. Find Median from Data Stream
#
# The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.
#
# For example, for arr = [2,3,4], the median is 3.
# For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
# Implement the MedianFinder class:
#
# MedianFinder() initializes the MedianFinder object.
# void addNum(int num) adds the integer num from the data stream to the data structure.
# double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
#
# Example 1:
#   Input
#     ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
#     [[], [1], [2], [], [3], []]
#   Output
#     [null, null, null, 1.5, null, 2.0]
#   Explanation
#     MedianFinder medianFinder = new MedianFinder();
#     medianFinder.addNum(1);    // arr = [1]
#     medianFinder.addNum(2);    // arr = [1, 2]
#     medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
#     medianFinder.addNum(3);    // arr[1, 2, 3]
#     medianFinder.findMedian(); // return 2.0
#
# Constraints:
#   -10^5 <= num <= 10^5
#   There will be at least one element in the data structure before calling findMedian.
#   At most 5 * 10^4 calls will be made to addNum and findMedian.
#########################
class MedianFinder
    def initialize
        @store = []
    end

=begin
    :type num: Integer
    :rtype: Void
    keep @store sorted as we add each num
=end
    def add_num(num)
        idx = @store.bsearch_index { |el| num <= el }
        if idx.nil?
            # num is larger than all @store elements
            @store << num
        else
            @store.insert(idx, num)
        end
    end

=begin
    :rtype: Float
=end
    def find_median
        idx = @store.length / 2
        if @store.length.odd?
            @store[idx].to_f
        else
            (@store[idx] + @store[idx-1]) / 2.0
        end
    end
end

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new()
# obj.add_num(num)
# param_2 = obj.find_median()
#########################
# add_num: Time complexity O(log(num)), Space complexity O(num)
# Beats 89% Runtime, 70% Memory