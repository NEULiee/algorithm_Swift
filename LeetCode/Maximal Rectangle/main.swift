//
//  main.swift
//  Maximal Rectangle
//
//  Created by 하늘이 on 2022/03/31.
//

import Foundation

class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        
        var result = 0
        var row = Array(repeating: Array(repeating: 0, count: matrix.count + 1), count: matrix[0].count + 1)
        var col = Array(repeating: Array(repeating: 0, count: matrix.count + 1), count: matrix[0].count + 1)
        
        for i in 1...matrix.count {
            for j in 1...matrix[0].count where matrix[i-1][j-1] == "1" {
                row[i][j] += row[i - 1][j]
                col[i][j] += col[i][j - 1]
                result = max(result, row[i][j] * col[i][j])
            }
        }
        
        return result
    }
}
