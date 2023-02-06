//
//  main.swift
//  House Robber
//
//  Created by neuli on 2023/02/06.
//

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 0, count: nums.count + 1)
        for i in 1...nums.count {
            if i == 0 || i == 1 {
                dp[i] = nums[i-1]
            } else {
                dp[i] = max(dp[i-2] + nums[i-1], dp[i-1])
            }
        }
        return dp[nums.count]
    }
}
