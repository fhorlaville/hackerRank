//
//  minAbs.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func minAbs(_ ints:[Int]) {
    var answer = Int.max
    let count = ints.count
    for i in 1..<count {
        answer = min(answer, abs(ints[i] - ints[i-1]))
    }
    print(answer)
}

func loadminAbs() {
    let _ = Int(readLine()!)!
    let ints = (readLine()!.components(separatedBy: " ").map{ Int($0)! }).sorted()
    minAbs(ints)
}
