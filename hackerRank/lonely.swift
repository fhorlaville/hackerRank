//
//  lonely.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func lonely(_ ints:[Int]) {
    var answer = ints[0]
    let count = ints.count
    let pairs = (count - 1) / 2
    
    if count > 1  && ints[0] == ints[1] {
        for i in 1..<pairs {
            if ints[2*i] != ints[2*i + 1] {
                answer = ints[2*i]
                break
            }
        }
        if answer == ints[0] {
            answer = ints[count - 1]
        }
        
    }
    
    print(answer)
}

func loadLonely() {
    let _ = Int(readLine()!)!
    let ints = (readLine()!.components(separatedBy: " ").map{ Int($0)! }).sorted()
    lonely(ints)
}

func lonelyXOR(_ ints:[Int]) {
    var answer = 0
    
    answer = ints.reduce(0, ^)
    
    print(answer)
}

func loadLonelyXOR() {
    let _ = Int(readLine()!)!
    let ints = (readLine()!.components(separatedBy: " ").map{ Int($0)! })
    lonelyXOR(ints)
}
