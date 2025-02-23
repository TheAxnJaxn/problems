#########################
# 104. Maximum Depth of Binary Tree
#
#   Given the root of a binary tree, return its maximum depth.
#
#   A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
#
#   Example 1:
#     Input: root = [3,9,20,null,null,15,7]
#     Output: 3
#   Example 2:
#     Input: root = [1,null,2]
#     Output: 2
#########################

  # Definition for a binary tree node. Provided by LeetCode.
  class TreeNode
    attr_accessor :val, :left, :right

    def initialize(val = 0, left = nil, right = nil)
      @val = val
      @left = left
      @right = right
    end
  end

  # @param {TreeNode} root
  # @return {Integer}
  def max_depth(root)
    return 0 if root.nil?

    left_depth = max_depth(root.left)
    right_depth = max_depth(root.right)

    return ([left_depth, right_depth].max + 1)
  end