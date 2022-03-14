//
//  main.swift
//  LeetCode_two sum
//
//  Created by 하늘이 on 2022/03/12.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []
        
        for firstIndex in 0..<nums.count {
            for secondIndex in (firstIndex + 1)..<nums.count {
                if nums[firstIndex] + nums[secondIndex] == target {
                    result.append(firstIndex)
                    result.append(secondIndex)
                    return result
                }
            }
        }
        return result
    }
}

// NOTE: The smartest way

//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var map = [Int: Int]()
//    for (i, n) in nums.enumerated() {
//        let diff = target - n
//        if let j = map[diff] {
//            return [i, j]
//        }
//        map[n] = i
//    }
//    return []
//}
