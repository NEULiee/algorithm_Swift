//
//  main.swift
//  Longest Common Prefix
//
//  Created by 하늘이 on 2022/03/15.
//

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let firstStr = strs[0]
        var count = 0
        
        for i in stride(from: firstStr.count, through: 0, by: -1) {
            let firstIndex = firstStr.index(firstStr.startIndex, offsetBy: 0)
            let endIndex = firstStr.index(firstStr.startIndex, offsetBy: i)
            count = 0
            
            for str in strs {
                if str.hasPrefix(String(firstStr[firstIndex..<endIndex])) {
                   count += 1
                }
            }
            
            if count == strs.count {
                return String(firstStr[firstIndex..<endIndex])
            }
        }
        
        return ""
    }
}

//class Solution {
//    func longestCommonPrefix(_ strs: [String]) -> String {
//
//        if strs.isEmpty { return "" }
//        var common = strs[0]
//
//        for ch in strs {
//            while !ch.hasPrefix(common) {
//                common = String(common.dropLast())
//            }
//        }
//        return common
//    }
//}
