//
//  main.swift
//  N-th Tribonacci Number
//
//  Created by neuli on 2023/03/24.
//

import Foundation

class Solution {

    func tribonacci(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        
        // 예외를 잘 생각해보자 : 경계값, 인덱스
        if n == 0 { return 0 }
        else if n == 1 || n == 2 { return 1 }

        dp[0] = 0
        dp[1] = 1
        dp[2] = 1

        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }

        return dp[n]
    }
}
