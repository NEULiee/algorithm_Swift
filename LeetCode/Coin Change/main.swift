//
//  main.swift
//  Coin Change
//
//  Created by neuli on 2023/02/06.
//

import Foundation

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 1...amount {
            for coin in coins where coin <= i {
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
        return amount < dp[amount] ? -1 : dp[amount]
    }
}
