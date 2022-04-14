//
//  main.swift
//  Longest Substring Without Repeating Characters
//
//  Created by neuli on 2022/04/13.
//
//  https://leetcode.com/problems/longest-substring-without-repeating-characters/

import Foundation


func lengthOfLongestSubstring(_ s: String) -> Int {
    let string = Array(s)
    var chars: [Character] = []
    var result = 0
    
    for i in 0..<s.count {
        let char = string[i]
        if let sameCharIndex = chars.firstIndex(of: char) {
            chars = Array(chars[(sameCharIndex+1)..<(chars.count)])
        }
        chars.append(char)
        result = max(result, chars.count)
    }
    return result
}

print(lengthOfLongestSubstring("abcabcbb"))
