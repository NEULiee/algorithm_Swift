//
//  main.swift
//  5582_공통 부분 문자열
//
//  Created by 하늘이 on 2022/03/26.
//

import Foundation

let str1 = Array(readLine()!)
let str2 = Array(readLine()!)
var longest = 0

var dp = Array(repeating: Array(repeating: 0, count: str2.count + 1), count: str1.count + 1)

for i in 1...str1.count {
    for j in 1...str2.count {
        if str1[i - 1] == str2[j - 1] {
            dp[i][j] = dp[i-1][j-1] + 1
            longest = max(longest, dp[i][j])
        }
    }
}

print(longest)
