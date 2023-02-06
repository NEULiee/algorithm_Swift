//
//  main.swift
//  Monotonic Array
//
//  Created by neuli on 2023/02/06.
//

import Foundation

class Solution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        if nums.count <= 1 { return true }
        return isAscending(nums) || isDescending(nums)
    }

    func isAscending(_ nums: [Int]) -> Bool {
        for (index, num) in nums.enumerated() {
            if index == 0 { continue }
            if nums[index - 1] > num {
                return false
            }
        }
        return true
    }

    func isDescending(_ nums: [Int]) -> Bool {
        for (index, num) in nums.enumerated() {
            if index == 0 { continue }
            if nums[index - 1] < num {
                return false
            }
        }
        return true
    }
}
