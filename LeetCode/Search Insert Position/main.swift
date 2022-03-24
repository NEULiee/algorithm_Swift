//
//  main.swift
//  Search Insert Position
//
//  Created by 하늘이 on 2022/03/24.
//

class Solution {
    
    func divide(_ nums:[Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
        if end <= start {
            return end
        }
        
        let mid = (start + end) / 2
        
        if target == nums[mid] {
            return mid
        } else if target < nums[mid] {
            return divide(nums, target, start, mid)
        } else if nums[mid] < target {
            return divide(nums, target, mid + 1, end)
        }
        return -1
    }
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        return divide(nums, target, 0, nums.count)
    }
}
