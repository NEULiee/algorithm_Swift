//
//  main.swift
//  Remove Duplicates from Sorted List
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        var newHead = ListNode(head!.val)
        var pointer: ListNode? = newHead
        var cur = head?.next
        var before = head!.val
        while cur != nil {
            if cur!.val != before {
                let node = ListNode(cur!.val)
                pointer?.next = node
                pointer = pointer?.next
                before = cur!.val
            }
            cur = cur?.next
        }

        return newHead
    }
}
