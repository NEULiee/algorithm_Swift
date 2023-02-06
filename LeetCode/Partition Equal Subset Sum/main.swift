//
//  main.swift
//  Partition Equal Subset Sum
//
//  Created by neuli on 2023/02/06.
//

import Foundation

class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = nums.reduce(0, +)
        if !sum.isMultiple(of: 2) { return false }
        sum /= 2

        var dp = Array(repeating: false, count: sum + 1)
        dp[0] = true
        for num in nums {
            for i in stride(from: sum, through: num, by: -1) {
                dp[i] = dp[i] || dp[i - num]
            }
        }
        return dp[sum]
    }
}

// class Solution {
//     func canPartition(_ nums: [Int]) -> Bool {
//         let sum = nums.reduce(0, +)
//         if sum % 2 != 0 {
//             return false
//         }
//         let target = sum / 2
//         var dp = Array(repeating: false, count: target + 1)
//         dp[0] = true
//         for num in nums {
//             for i in stride(from: target, through: num, by: -1) {
//                 dp[i] = dp[i] || dp[i - num]
//             }
//         }
//         return dp[target]
//     }
// }
