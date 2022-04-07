//
//  main.swift
//  Average salary excluding the minimum and maximum salary
//
//  Created by neuli on 2022/04/07.
//
//  https://leetcode.com/problems/average-salary-excluding-the-minimum-and-maximum-salary/submissions/

import Foundation

class Solution {
    func average(_ salary: [Int]) -> Double {
        var salary = salary.sorted()[1..<salary.count-1]
        return salary.reduce(0.0, {
            $0 + Double($1)
        }) / Double(salary.count)
    }
}

// One-Line
//class Solution {
//    func average(_ salary: [Int]) -> Double {
//        return Double(salary.reduce(0, +) - (salary.min()! + salary.max()!)) / Double(salary.count - 2)
//    }
//}

