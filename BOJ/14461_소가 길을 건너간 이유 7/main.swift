//
//  main.swift
//  14461_소가 길을 건너간 이유 7
//
//  Created by neuli on 2022/05/06.
//
//  https://www.acmicpc.net/problem/14461

import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0]
let T = input[1]

var grass: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
var times: [[Int]] = Array(repeating: Array(repeating: Int.max, count: N), count: N)
var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: 3), count: N), count: N)
var pq: [(time: Int, Int, Int, count: Int)] = []

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

for i in 0..<N {
    input = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in 0..<N {
        grass[i][j] = input[j]
    }
}

func isIn(_ x: Int, _ y: Int) -> Bool {
    return 0<=x && x<N && 0<=y && y<N
}

times[0][0] = 0
pq.append((time: 0, 0, 0, count: 0))

while !pq.isEmpty {
    let cur = pq.removeLast()
    
    if visited[cur.1][cur.2][cur.count] { continue }
    visited[cur.1][cur.2][cur.count] = true
    
    times[cur.1][cur.2] = min(times[cur.1][cur.2], cur.time)
    
    for i in 0..<4 {
        let nx = cur.1 + dx[i]
        let ny = cur.2 + dy[i]
        let nextCount = cur.count == 2 ? 0 : cur.count + 1
        if isIn(nx, ny) {
            let nextTime = cur.count == 2 ? cur.time + grass[nx][ny] + T : cur.time + T
            pq.append((nextTime, nx, ny, nextCount))
        }
    }
    pq.sort(by: { $0.time > $1.time })
}

print(times[N-1][N-1])
