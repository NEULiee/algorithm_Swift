//
//  main.swift
//  Valid Parentheses
//
//  Created by 하늘이 on 2022/03/17.
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        
        var stack: [Character] = []
        
        for character in s {
            switch character {
            case "(": stack.append(")")
            case "{": stack.append("}")
            case "[": stack.append("]")
            default:
                if stack.isEmpty || stack.removeLast() != character {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
