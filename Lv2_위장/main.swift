//
//  main.swift
//  Lv2_위장
//
//  Created by 하늘이 on 2022/03/09.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var result = 1
    var clothesDict: Dictionary<String, Int> = [:]
    
    for cloth in clothes {
        if clothesDict[cloth[1]] == nil {
            clothesDict[cloth[1]] = 1
        } else {
            clothesDict.updateValue(clothesDict[cloth[1]]! + 1, forKey: cloth[1])
        }
    }
    
    for (key, value) in clothesDict {
        result *= value + 1
    }
    
    return result - 1
}
