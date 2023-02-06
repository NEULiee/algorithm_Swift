//
//  main.swift
//  Happy Number
//
//  Created by neuli on 2023/02/06.
//

import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var num = n
        var set: Set<Int> = []
        set.insert(num)

        while true {
            if num == 1 {
                return true
            }
            let arr = Array(String(num)).flatMap { Int(String($0)) }
            num = arr.reduce(0) { $0 + $1 * $1 }
            if set.contains(num) {
                return false
            } else {
                set.insert(num)
            }
        }
        return false
    }
}
