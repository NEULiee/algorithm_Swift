//
//  main.swift
//  Greatest English Letter in Upper and Lower Case
//
//  Created by neuli on 2022/07/09.
//
//  https://leetcode.com/problems/greatest-english-letter-in-upper-and-lower-case/

import Foundation

class Solution {
    func greatestLetter(_ s: String) -> String {
        
        var set: Set<String> = []
        var result: [String] = []
        
        for char in s {
            set.insert(String(char))
        }
        
        for alpha in set {
            let char = Character(alpha)
            if "a" <= alpha && alpha <= "z"
                && set.contains(String(UnicodeScalar(char.asciiValue! - 32))) {
                result.append(String(UnicodeScalar(char.asciiValue! - 32)))
            } else if "A" <= alpha && alpha <= "Z"
                && set.contains(String(UnicodeScalar(char.asciiValue! + 32))) {
                result.append(alpha)
            }
        }
        
        if result.isEmpty {
            return ""
        }
        
        result.sort()
        return result.last!
    }
}
