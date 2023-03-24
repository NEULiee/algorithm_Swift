//
//  main.swift
//  Fibonacci Number
//
//  Created by neuli on 2023/03/24.
//

import Foundation

class Solution {

    func fib(_ n: Int) -> Int {
        return f(n)
    }

    func f(_ n: Int) -> Int {
        if n == 0 { return 0 }
        else if n == 1 { return 1 }
        return f(n - 1) + f(n - 2)
    }
}
