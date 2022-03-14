//
//  main.swift
//  Romna to Integer
//
//  Created by 하늘이 on 2022/03/14.
//

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        
        let symbols = [ "IV", "IX", "XL", "XC", "CD", "CM", "I", "V", "X", "L", "C", "D", "M" ]
        let symbolNumber = [ 4, 9, 40, 90, 400, 900, 1, 5, 10, 50, 100, 500, 1000 ]

        
        var str = s
        
        for i in 0..<symbols.count {
            str = str.replacingOccurrences(of: symbols[i], with: String(symbolNumber[i]) + " ")
        }
        
        let array = str.split(separator: " ").map{ Int($0)! }
        
        return array.reduce(0, { $0 + $1 })
    }
}
