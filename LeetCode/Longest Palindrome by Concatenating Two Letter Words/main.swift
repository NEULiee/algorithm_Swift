//
//  main.swift
//  Longest Palindrome by Concatenating Two Letter Words
//
//  Created by neuli on 2023/02/06.
//

import Foundation

class Solution {
    func longestPalindrome(_ words: [String]) -> Int {
        var wordsCount: [String: Int] = [:]
        var reversedSame = 0
        var oddCount = 0
        var result = 0
        for word in words {
            wordsCount[word, default: 0] += 1
        }
        for (key, value) in wordsCount {
            if key == String(key.reversed()) {
                if value.isMultiple(of: 2) {
                    result += value
                } else {
                    oddCount += 1
                    reversedSame += value
                }
            } else if wordsCount[String(key.reversed())] != nil {
                let count = min(value, wordsCount[String(key.reversed())]!)
                result += count
            }
        }
        return 0 < oddCount ? (result + reversedSame - oddCount + 1) * 2 : result * 2
    }
}
