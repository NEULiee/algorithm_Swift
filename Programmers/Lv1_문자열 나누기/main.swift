//
//  main.swift
//  Lv1_문자열 나누기
//
//  Created by neuli on 2022/12/22.
//

import Foundation

func solution(_ s: String) -> Int {
    let s = Array(s).map { String($0) }
    var count = 0, diffCount = 0, result = 0
    var cur = s[0]
    
    for i in 0..<s.count {
        if count == 0 {
            if i == s.count - 1 {
                result += 1
                break
            }
            cur = s[i]
            count += 1
            continue
        }
        
        if cur == s[i] {
            count += 1
        }
        else {
            diffCount += 1
        }
        
        if count == diffCount {
            result += 1
            count = 0
            diffCount = 0
        }
    }
    
    if count != 0 {
        print("나왓나")
        result += 1
    }
    
    return result
}
