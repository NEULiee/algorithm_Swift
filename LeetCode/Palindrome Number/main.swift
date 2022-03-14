//
//  main.swift
//  Palindrome Number
//
//  Created by 하늘이 on 2022/03/13.
//

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        
        let digit = Float(String(x).count)
        var startIdx: Float = 0, endIdx: Float = digit - 1.0, startNum = 0, endNum = 0
        
        while startIdx < endIdx {
            startNum = (x / Int(pow(10.0, startIdx))) % 10
            endNum = (x / Int(pow(10.0, endIdx))) % 10
            
            if startNum == endNum {
                startIdx += 1
                endIdx -= 1
                continue
            } else {
                return false
            }
        }
        return true
    }
}

//class Solution {
//    func isPalindrome(_ x: Int) -> Bool {
//        return x < 0 ? false : method(x: x) == x
//    }
//    private func method(x: Int) -> Int {
//        var r = 0
//        var x = x
//        while x != 0 {
//            r = r * 10
//            r = r + x % 10
//            x /= 10
//        }
//        return (r < Int32.min || r > Int32.max) ? 0 : r
//    }
//}
//
//class Solution {
//    func isPalindrome(_ x: Int) -> Bool {
//        guard x >= 0 else { return false }
//
//        var xMutable = x
//        var reversed = 0
//
//        while xMutable != 0 {
//            let remainder = xMutable % 10
//            reversed = (reversed * 10) + remainder
//            xMutable = xMutable / 10
//        }
//        return x == reversed
//    }
//}
