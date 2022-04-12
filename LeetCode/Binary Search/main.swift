//
//  main.swift
//  Binary Search
//
//  Created by neuli on 2022/04/09.
//

import Foundation

class Solution {
    
    func binarySearch(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
        if end < start {
            return -1
        }
        let mid = (start + end) / 2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            return binarySearch(nums, mid + 1, end, target)
        } else {
            return binarySearch(nums, start, mid - 1, target)
        }
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums, 0, nums.count-1, target)
    }
}

//class Solution {
//    func search(_ nums: [Int], _ target: Int) -> Int {
//        var start = 0, end = nums.count - 1
//        while start <= end {
//            let mid = (start + end) / 2
//            if nums[mid] == target { return mid }
//            target < nums[mid] ? (end = mid - 1) : (start = mid + 1)
//        }
//        return -1
//    }
//}
