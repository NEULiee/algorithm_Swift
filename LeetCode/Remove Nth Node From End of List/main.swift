//
//  main.swift
//  Remove Nth Node From End of List
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var cur: ListNode? = head
        var front: ListNode? = nil
        var count = 0
        var result: [Int] = []
        var head = head

        while cur != nil {
            cur = cur?.next
            count += 1
        }
        let findIndex = count - n
        
        cur = head
        if findIndex == 0 {
            head = cur?.next
        }
        for i in 0..<findIndex {
            if i == findIndex - 1 {
                front = cur
            }
            cur = cur?.next
        }

        front?.next = cur?.next

        cur = head
        
        return cur
    }
}
