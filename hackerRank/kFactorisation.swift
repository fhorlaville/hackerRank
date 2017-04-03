//
//  kFactorisation.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func kFactorization(targetValue: Int, numberOfMultipliers:Int, multipliers:[Int]) {
    var state: [Int] = [1]
    var currentValue = targetValue
    var currentAvailableMultipliers = multipliers
    
    var touched = true
    while currentValue > 1 && touched {
        touched = false
        for i in 0..<numberOfMultipliers {
            if currentValue % currentAvailableMultipliers[i] == 0 {
                state.insert(currentValue, at: 1)
                currentValue = currentValue / currentAvailableMultipliers[i]
                touched = true
                break
            }
        }
    }
    if currentValue != 1 {
        print("-1")
    } else {
        print(state)
    }
}

//kFactorization(targetValue: 12, numberOfMultipliers:3, multipliers: [2, 3, 4])
//kFactorization(targetValue: 15, numberOfMultipliers:5, multipliers: [2, 10, 6, 9, 11])
//kFactorization(targetValue: 72, numberOfMultipliers:9, multipliers: [2, 4, 6, 9, 3, 7, 16, 10, 5])


func loadkFactorisation() {
    let settings = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    let targetValue = settings[0]
    let numberOfMultipliers = settings[1]
    let multipliers = (readLine()!.components(separatedBy: " ").map{ Int($0)! }).sorted(by: { $0 > $1 })
    
    kFactorization(targetValue: targetValue, numberOfMultipliers:numberOfMultipliers, multipliers:multipliers)
}

