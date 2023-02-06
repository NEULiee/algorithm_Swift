//
//  main.swift
//  Flood Fill
//
//  Created by neuli on 2023/02/06.
//

import Foundation

class Solution {

    let dr = [0, 1, 0, -1]
    let dc = [1, 0, -1, 0]

    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var q: [(r: Int, c: Int)] = []
        var visited = Array(repeating: Array(repeating: false, count: image[0].count), count: image.count)
        var result = image
        let num = image[sr][sc]
        q.append((sr, sc))

        while !q.isEmpty {
            let (r, c) = q.removeFirst()
            if visited[r][c] { continue }
            visited[r][c] = true
            result[r][c] = color
            for i in 0..<4 {
                let nr = r + dr[i]
                let nc = c + dc[i]
                if isIn(&result, nr, nc) && !visited[nr][nc] && result[nr][nc] == num && result[nr][nc] != color {
                    q.append((nr, nc))
                }
            }
        }

        return result
    }

    func isIn(_ image: inout [[Int]], _ r: Int, _ c: Int) -> Bool {
        let mr = image.count, mc = image[0].count
        return 0<=r && r<mr && 0 <= c && c<mc
    }
}
