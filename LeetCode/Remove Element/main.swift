//
//  main.swift
//  Remove Element
//
//  Created by 하늘이 on 2022/03/22.
//

import Foundation

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter{ $0 != val }
        return nums.count
    }
}
