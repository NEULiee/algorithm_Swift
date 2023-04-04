//
//  main.swift
//  Lv3_단어 변환
//
//  Created by neuli on 2023/04/05.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/43163

import Foundation

func solution(_ begin: String, _ target: String, _ words: [String]) -> Int {
    let count = words.count
    var result = count
    if !words.contains(target) {
        return 0
    }
    var visited = Array(repeating: false, count: count)
    dfs(begin, target, words, &visited, 0, &result)
    return result
}

func dfs(_ begin: String, _ target: String, _ words: [String], _ visited: inout [Bool], _ count: Int, _ result: inout Int) {
    if begin == target {
        result = min(result, count)
        return
    }
    if count == words.count {
        return
    }
    let nextWords = findNextWords(begin, target, words, &visited)
    for (index, word) in nextWords {
        visited[index] = true
        dfs(word, target, words, &visited, count + 1, &result)
        visited[index] = false
    }
}

func findNextWords(
    _ begin: String,
    _ target: String,
    _ words: [String],
    _ visited: inout [Bool]
) -> [(index: Int, word: String)] {
    let beginArr = Array(begin).map { String($0) }
    let count = beginArr.count
    return words.enumerated()
        .filter { index, word in
            let wordArr = Array(word).map { String($0) }
            var diffCount = 0
            for i in 0..<count where beginArr[i] != wordArr[i] {
                diffCount += 1
            }
            return (diffCount == 1 ? true : false) && !visited[index]
        }
        .map { (index: $0.offset, word: $0.element) }
}
