//
//  main.swift
//  LV1_없는 숫자 더하기
//
//  Created by neuli on 2022/07/07.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/86051

import Foundation

func solution(_ numbers: [Int]) -> Int {
    return [0, 1, 2, 3, 4, 5, 6, 7 ,8, 9].filter { !numbers.contains($0) }.reduce (0, { $0 + $1 })
}
