//
//  main.swift
//  Largest Rectangle in Histogram
//
//  Created by 하늘이 on 2022/03/31.
//

import Foundation

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {

        var stack: [Int] = []
        var heights: [Int] = heights
        var result = 0

        heights.append(0)

        for (index, height) in heights.enumerated() {
            while !stack.isEmpty && height < heights[stack.last!] {
                let top = heights[stack.removeLast()]
                let range = stack.isEmpty ? -1 : stack.last!
                
                result = max(result, top * (index - range - 1))
            }
            stack.append(index)
        }
        return result
    }
}
