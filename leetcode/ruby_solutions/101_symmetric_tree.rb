#########################
# 101. Symmetric Tree
#
# Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).
#
# Input: root = [1,2,2,3,4,4,3]
# Output: true
#
# Input: root = [1,2,2,null,3,null,3]
# Output: false
#
# Constraints:
#   The number of nodes in the tree is in the range [1, 1000].
#   -100 <= Node.val <= 100
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

#########################
# @param {TreeNode} left, right
# @return {Boolean}
def mirror?(left, right)
    if left.nil? && right.nil?
        return true
    elsif left.nil? || right.nil?
        return false
    elsif left.val != right.val
        return false
    else
        return mirror?(left.left, right.right) && mirror?(left.right, right.left)
    end
end

# @param {TreeNode} root
# @return {Boolean}
#   *Style note: Ruby style guides would prefer to call this
#   def symmetric?(root)
#   but the LeetCode runner wouldn't be able to run it.
def is_symmetric(root)
    return true if root.nil? || root.val.nil?

    return mirror?(root.left, root.right)
end
#########################
# Beats 2% Runtim, 100% Memory