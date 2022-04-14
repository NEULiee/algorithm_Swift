//
//  main.swift
//  Length of last word
//
//  Created by neuli on 2022/04/13.
//
//  https://leetcode.com/problems/length-of-last-word/

import Foundation

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let words = s.split(separator: " ")
        if let word = words.last {
            return word.count
        }
        return 0
    }
}
