//
//  main.swift
//  Lv1_가장 가까운 같은 글자
//
//  Created by neuli on 2022/12/20.
//

import Foundation

func solution(_ s: String) -> [Int] {
    let array = Array(s).map { String($0) }
    var result: [Int] = []
    
    array.enumerated().forEach { offset, char in
        if let matchIndex = array[0..<offset].lastIndex(of: char) {
            result.append(offset - matchIndex)
        } else {
            result.append(-1)
        }
    }
    
    return result
}
