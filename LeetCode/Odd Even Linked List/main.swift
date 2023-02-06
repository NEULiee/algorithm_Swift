//
//  main.swift
//  Odd Even Linked List
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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }

        var odd: ListNode? = head
        var even: ListNode? = head?.next
        var evenHead: ListNode? = even

        while even?.next != nil && even != nil {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }
        
        odd?.next = evenHead

        return head
    }
}
