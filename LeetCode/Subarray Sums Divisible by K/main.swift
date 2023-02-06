//
//  main.swift
//  Subarray Sums Divisible by K
//
//  Created by neuli on 2023/02/06.
//

import Foundation

class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var remindersMap = [Int: Int]()
        var prefixSum = 0
        var result = 0

        for i in 0..<nums.count {
            prefixSum += nums[i]
            let reminder = prefixSum % k
            if reminder == 0 { result += 1 }
            result += remindersMap[reminder] ?? 0
            if reminder > 0 {
                result += remindersMap[reminder - k] ?? 0
            } else if reminder < 0 {
                result += remindersMap[reminder + k] ?? 0
            }
            remindersMap[reminder, default: 0] += 1
        }

        return result
    }
}
