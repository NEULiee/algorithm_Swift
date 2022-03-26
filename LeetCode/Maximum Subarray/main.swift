//
//  main.swift
//  Maximum Subarray
//
//  Created by 하늘이 on 2022/03/26.
//

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var curSum = nums[0], maxSum = nums[0]
        for i in 1..<nums.count {
            curSum = max(curSum + nums[i], nums[i])
            maxSum = max(curSum, maxSum)
        }
        return maxSum
    }
}
