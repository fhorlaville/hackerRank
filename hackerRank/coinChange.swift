//
//  coinChange.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func coinChange() {
    
    
    let settings = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    let targetValue = settings[0]
    let coinTypes = settings[1]
    var coinValues = (readLine()!.components(separatedBy: " ").map{ Int($0)! }).sorted(by: { $0 > $1 })
    
    var solutionsArray: [[Int]] = []
    
    func value( coins: [Int]) -> Int {
        var total = 0
        
        for (index, coinQty) in coins.enumerated() {
            total += coinQty * coinValues[index]
        }
        
        return total
    }
    
    func remain( initial: Int, coins: [Int]) -> Int {
        return initial - value(coins: coins)
    }
    
    func isInSolutionsArray(attempt: [Int]) -> Bool {
        var answer = false
        for solution in solutionsArray {
            if attempt == solution {
                answer = true
                break
            }
        }
        return answer
    }
    
    var attempt = Array(repeating: 0, count: coinTypes)
    
    if value(coins: attempt) == targetValue {
        if !isInSolutionsArray(attempt: attempt) {
            solutionsArray.append(attempt)
        }
    }
    
    
    print(solutionsArray.count)
    print (coinValues)
    
    for currentCoin in 0..<coinTypes {
        for i in 0..<targetValue {
            attempt = [0,0,0,i]
            print(value(coins: attempt))
            
        }
    }
}


//coinChange()

