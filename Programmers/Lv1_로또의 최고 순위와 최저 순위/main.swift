//
//  main.swift
//  Lv1_로또의 최고 순위와 최저 순위
//
//  Created by neuli on 2022/05/05.
//
//  https://programmers.co.kr/learn/courses/30/lessons/77484

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var correctCount: Int = 0
    var zeroCount: Int = 0
    var result: [Int] = []
    let ranking: Dictionary<Int, Int> = [6 : 1, 5 : 2, 4 : 3, 3 : 4, 2 : 5, 1 : 6, 0 : 6]
    
    for lotto in lottos {
        if lotto == 0 {
            zeroCount += 1
        }
        else if win_nums.contains(lotto) {
            correctCount += 1
        }
    }
    
    result.append(ranking[correctCount + zeroCount])
    result.append(ranking[correctCount]!)
    return result
}
