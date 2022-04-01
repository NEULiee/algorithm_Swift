//
//  main.swift
//  6549_히스토그램에서 가장 큰 직사각형
//
//  Created by 하늘이 on 2022/04/01.
//

import Foundation

while true {

    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input.count == 1 && input[0] == 0 {
        break
    }
    
    let n = input[0]
    var result = 0
    var heights: [Int] = []
    var stack: [Int] = []
    for i in 1...n {
        heights.append(input[i])
    }
    heights.append(0)
    
    for (index, height) in heights.enumerated() {
        while !stack.isEmpty && height < heights[stack.last!] {
            let topHeight = heights[stack.removeLast()]
            let range = stack.isEmpty ? -1 : stack.last!
            result = max(result, topHeight * (index - range - 1))
        }
        stack.append(index)
    }
    print(result)
}
