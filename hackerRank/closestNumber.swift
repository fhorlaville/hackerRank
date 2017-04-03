//
//  closestNumber.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func closestNumber(itemsCount: Int, items:[Int]) {
    let items = items.sorted()
    var differences = [Int]()
    
    for i in 0..<itemsCount-1 {
        differences.append(abs(items[i] - items[i+1]))
    }
    let minDifference = differences.min()
    
    for i in 0..<itemsCount-1 {
        if differences[i] == minDifference {
            print(items[i], items[i+1], terminator:" ")
        }
    }
    print("")
}

func closestNumbersLoader() {
    let line1 = Int(readLine()!)!
    let line2 = (readLine()!.components(separatedBy: " ").map{ Int($0)! })
    closestNumber(itemsCount: line1, items: line2)
}

func testClosestNumbers() {
    closestNumber(itemsCount: 10, items: [-20, -3916237, -357920, -3620601, 7374819, -7330761, 30, 6246457, -6461594, 266854])
    closestNumber(itemsCount: 12, items: [-20, -3916237, -357920, -3620601, 7374819, -7330761, 30, 6246457, -6461594, 266854, -520, -470])
    closestNumber(itemsCount: 4, items: [5, 4, 3, 2])
}
