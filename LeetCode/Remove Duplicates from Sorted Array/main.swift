//
//  main.swift
//  Remove Duplicates from Sorted Array
//
//  Created by 하늘이 on 2022/03/21.
//

import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var index = 0
        for num in nums where num != nums[index] {
            index += 1
            nums[index] = num
        }
        return index + 1
    }
}
