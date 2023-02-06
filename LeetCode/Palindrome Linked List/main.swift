//
//  main.swift
//  Palindrome Linked List
//
//  Created by neuli on 2023/02/06.
//

import Foundation


 // Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var cur = head
        var arr: [Int] = []
        while cur != nil {
            arr.append(cur!.val)
            cur = cur?.next
        }
        let count = arr.count
        for i in 0..<count / 2 where arr[i] != arr[count - i - 1] {
            return false
        }
        return true
    }
}
