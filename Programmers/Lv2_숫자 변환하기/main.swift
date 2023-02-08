//
//  main.swift
//  Lv2_숫자 변환하기
//
//  Created by neuli on 2023/02/08.
//

import Foundation

func solution(_ x: Int, _ y: Int, _ n: Int) -> Int {
    var arr = Array(repeating: Int.max, count: y + 1)
    arr[x] = 0
    
    for i in x...y where arr[i] != Int.max {
        if i + n <= y {
            arr[i + n] = min(arr[i] + 1, arr[i + n])
        }
        if i * 2 <= y {
            arr[i * 2] = min(arr[i] + 1, arr[i * 2])
        }
        if i * 3 <= y {
            arr[i * 3] = min(arr[i] + 1, arr[i * 3])
        }
    }
    return arr[y] == Int.max ? -1 : arr[y]
}
