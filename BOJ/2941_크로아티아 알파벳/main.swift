//
//  main.swift
//  2941_크로아티아 알파벳
//
//  Created by 하늘이 on 2022/03/06.
//

import Foundation

var word = readLine()!

let changeWord = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

for w in changeWord {
    word = word.replacingOccurrences(of: w, with: ".")
}

print(word.count)
