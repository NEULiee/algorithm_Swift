//
//  main.swift
//  Lv1_과일 장수
//
//  Created by neuli on 2022/12/27.
//

import Foundation

func solution(_ k: Int, _ m: Int, _ score: [Int]) -> Int {
    let score = score.sorted(by: >)
    let box = score.count / m
    if box == 0 { return 0 }
    var result = 0
    for i in 1...box {
        result += score[m * i - 1]
    }
    return result * m
}
