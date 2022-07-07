//
//  main.swift
//  Lv1_음양더하기
//
//  Created by neuli on 2022/07/07.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/76501

import Foundation

func solution(_ absolutes: [Int], _ signs: [Bool]) -> Int {
    var result = 0
    for (index, num) in absolutes.enumerated() {
        switch signs[index] {
        case true:
            result += num
        case false:
            result -= num
        }
    }
    return result
}
