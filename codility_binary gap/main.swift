//
//  main.swift
//  codility_binary gap
//
//  Created by 하늘이 on 2022/03/12.
//

import Foundation
import Glibc

public func solution(_ N : Int) -> Int {

    var zeroCount = 0, longestZeroCount = 0, num = N
    var isGap = false

    while true {
        if num == 1 {
            longestZeroCount = max(zeroCount, longestZeroCount)
            break
        }

        if isGap && num % 2 == 0 {
            zeroCount += 1
        } else if isGap && num % 2 == 1 {
            longestZeroCount = max(zeroCount, longestZeroCount)
            zeroCount = 0
        } else if !isGap && num % 2 == 1 {
            isGap = true
        }

        num /= 2
    }

    return longestZeroCount
}
