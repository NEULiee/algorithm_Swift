//
//  main.swift
//  Lv1_공원산책
//
//  Created by neuli on 2023/03/28.
//

import Foundation

let dict: [String: (r: Int, c: Int)] = [
    "N": (-1, 0), "S": (1, 0), "W": (0, -1), "E": (0, 1)
]

func solution(_ park: [String], _ routes: [String]) -> [Int] {
    var maps: [[String]] = []
    var curR = 0, curC = 0
    var maxR = park.count
    var maxC = park[0].count
    
    for roads in park {
        maps.append(Array(roads).map { String($0) })
    }
    
    for r in 0..<maxR {
        for c in 0..<maxC where maps[r][c] == "S" {
            curR = r
            curC = c
        }
    }
    for route in routes {
        let components = route.components(separatedBy: " ")
        let op = components[0]
        let n = Int(components[1])!
        if let next = move(maps, maxR, maxC, curR, curC, op, n) {
            curR = next.r
            curC = next.c
        }
    }
    
    return [curR, curC]
}

func move(
    _ maps: [[String]],
    _ maxR: Int,
    _ maxC: Int,
    _ r: Int,
    _ c: Int,
    _ op: String,
    _ n: Int
) -> (r: Int, c: Int)? {
    var nr = 0, nc = 0
    for i in 1...n {
        nr = r + dict[op]!.r * i
        nc = c + dict[op]!.c * i
        if !isIn(nr, nc, maxR, maxC) || maps[nr][nc] == "X" {
            return nil
        }
    }
    return (nr, nc)
}

func isIn(_ r: Int, _ c: Int, _ maxR: Int, _ maxC: Int) -> Bool {
    return 0<=r && r<maxR && 0<=c && c<maxC
}
