//
//  main.swift
//  Spiral Matrix
//
//  Created by neuli on 2023/02/06.
//

import Foundation

enum Direction {
    case right, down, left, up
}

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let m = matrix.count
        let n = matrix[0].count
        var left = 0, right = n - 1, top = 0, bottom = m - 1
        var direction = Direction.right
        var result: [Int] = []

        while left <= right && top <= bottom {
            switch direction {
            case .right:
                for i in left...right {
                    result.append(matrix[top][i])
                }
                top += 1
                direction = .down
            case .down:
                for i in top...bottom {
                    result.append(matrix[i][right])
                }
                right -= 1
                direction = .left
            case .left:
                for i in stride(from: right, through: left, by: -1) {
                    result.append(matrix[bottom][i])
                }
                bottom -= 1
                direction = .up
            case .up:
                for i in stride(from: bottom, through: top, by: -1) {
                    result.append(matrix[i][left])
                }
                left += 1
                direction = .right
            }
        }
        return result
    }
}
