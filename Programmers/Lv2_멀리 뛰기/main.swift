//
//  main.swift
//  Lv2_멀리 뛰기
//
//  Created by neuli on 2023/02/10.
//

import Foundation

func solution(_ n: Int) -> Int {
    if n == 1 { return 1 }
    let num = 1234567
    var dp = Array(repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 1
    for i in 1...(n-1) {
        if i + 1 <= n {
            dp[i+1] += dp[i]
            dp[i+1] %= num
        }
        if i + 2 <= n {
            dp[i+2] += dp[i] % num
            dp[i+2] %= num
        }
    }
    return dp[n]
}

