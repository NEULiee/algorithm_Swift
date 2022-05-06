//
//  main.swift
//  Lv1_크레인 인형뽑기 게임
//
//  Created by neuli on 2022/05/06.
//

import Foundation

func findTop(_ board: inout [[Int]], _ num: Int) -> Int {
    for i in 0..<board.count where board[i][num - 1] != 0 {
        let top = board[i][num - 1]
        board[i][num - 1] = 0
        return top
    }
    return 0
}

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var basket: [Int] = []
    var result = 0
    
    for move in moves {
        let top = findTop(&board, move)
        if top != 0 {
            if !basket.isEmpty && basket.last! == top {
                result += 2
                basket.removeLast()
            } else {
                basket.append(top)
            }
        }
    }
    return result
}

let board = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
let moves = [1,5,3,5,1,2,1,4]

print(solution(board, moves))
