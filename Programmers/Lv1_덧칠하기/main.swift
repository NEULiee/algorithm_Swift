//
//  main.swift
//  Lv1_덧칠하기
//
//  Created by neuli on 2023/04/05.
//

import Foundation

func solution(_ n: Int, _ m: Int, _ section: [Int]) -> Int {
    var result = 0
    var cur = 0
    for num in section where cur <= num {
        cur = num + m
        result += 1
    }
    
    return result
}
