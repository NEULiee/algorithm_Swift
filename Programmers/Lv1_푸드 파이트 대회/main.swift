//
//  main.swift
//  Lv1_푸드 파이트 대회
//
//  Created by neuli on 2022/12/27.
//

import Foundation

func solution(_ food: [Int]) -> String {
    var result: [Int] = []
    food.enumerated().forEach { index, value in
        let count = value / 2
        result.append(contentsOf: Array(repeating: index, count: count))
    }
    result.append(0)
    result.append(contentsOf: result[0..<(result.count - 1)].reversed())
    return result.map { String($0) }.joined()
}
