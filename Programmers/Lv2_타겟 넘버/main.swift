//
//  main.swift
//  Lv2_타겟 넘버
//
//  Created by neuli on 2022/04/05.
//

import Foundation

func dfs(_ numbers: [Int], _ target: Int, _ index: Int, _ number: Int, _ answer: inout Int) {
    
    if index == numbers.count {
        if number == target {
            answer += 1
        }
        return
    }
    
    dfs(numbers, target, index + 1, number + numbers[index], &answer)
    dfs(numbers, target, index + 1, number - numbers[index], &answer)
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var answer = 0
    
    dfs(numbers, target, 0, 0, &answer)
    
    return answer
}
