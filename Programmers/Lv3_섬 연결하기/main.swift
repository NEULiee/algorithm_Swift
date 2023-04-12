//
//  main.swift
//  Lv3_섬 연결하기
//
//  Created by neuli on 2023/04/13.
//

import Foundation

func solution(_ n: Int, _ costs: [[Int]]) -> Int {
    var parent: [Int] = []
    var result = 0
    var costs = costs
    for i in 0..<n {
        parent.append(i)
    }
    
    costs.sort { $0[2] < $1[2] }
    
    for cost in costs {
        union(cost[0], cost[1], cost[2], &parent, &result)
        print(parent)
    }
    
    return result
}

func findParent(_ n: Int, _ parent: inout [Int]) -> Int {
    if parent[n] == n { return n }
    let p = findParent(parent[n], &parent)
    parent[n] = p
    return p
}

func union(_ n: Int, _ m: Int, _ distance: Int, _ parent: inout [Int], _ result: inout Int) {
    let parentN = findParent(n, &parent)
    let parentM = findParent(m, &parent)
    if parentN == parentM { return }
    if parentN < parentM {
        parent[parentN] = parentM
    } else {
        parent[parentM] = parentN
    }
    result += distance
}
