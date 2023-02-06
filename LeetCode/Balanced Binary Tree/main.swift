//
//  main.swift
//  Balanced Binary Tree
//
//  Created by neuli on 2023/02/06.
//

import Foundation

//  Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        if !isBalanced(root.left) || !isBalanced(root.right) { return false }
        return abs(height(root.left) - height(root.right)) < 2
    }

    func height(_ root: TreeNode?) -> Int {
        guard let root = root else { return -1 }
        return 1 + max(height(root.left), height(root.right))
    }
}
