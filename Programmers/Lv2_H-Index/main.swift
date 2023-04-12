//
//  main.swift
//  Lv2_H-Index
//
//  Created by neuli on 2023/04/13.
//

import Foundation

func solution(_ citations: [Int]) -> Int {
    let citations = citations.sorted(by: <)
    let n = citations.count
    var h = 0
    
    for i in 1...n where i <= citations[n - i] {
        h = i
    }
    return h
}
