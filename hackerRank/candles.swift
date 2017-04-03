//
//  candles.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func candles() {
    let n = Int(readLine()!)!
    let line0 = readLine()!.components(separatedBy: " ").map{ Int($0)! }.sorted(by: { $0 > $1 })
    
    var answer = 0
    var previous = line0[0]
    for i in 0..<n {
        if line0[i] == previous {
            answer += 1
            previous = line0[i]
        } else {
            break
        }
    }
    
    print(answer)
}
