//
//  30DaysOfCode.swift
//  hackerRank
//
//  Created by Franck Horlaville on 14/03/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func simplify(top:Int, bottom:Int) -> (newTop:Int, newBottom:Int) {
    
    var x = top
    var y = bottom
    while (y != 0) {
        let buffer = y
        y = x % y
        x = buffer
    }
    let hcfVal = x
    let newTopVal = top/hcfVal
    let newBottomVal = bottom/hcfVal
    return(newTopVal, newBottomVal)
}

func hrChallenge1() {
    let target = 9
    var rolls = 0
    var chances = 0
    var result = [Int: Int]()
    for i in 1...6 {
        for j in 1...6 {
            result[i+j] = (result[i+j] ?? 0) + 1
            rolls += 1
        }
    }
    for (score, times) in result {
        if score <= target {
            chances += times
        }
    }
    //print("\(chances)/\(rolls)")
    (chances, rolls) = simplify(top: chances, bottom: rolls)
    
    print("\(chances)/\(rolls)")
}

//------------------------

func hrChallenge2(mealCost: Double, tip: Int, tax: Int) {
    let mealCostInCents = Int(100 * mealCost)
    let mealTipInCents = Int(mealCostInCents * tip / 100)
    let mealTaxInCents = Int(mealCostInCents * tax / 100)
    
    let totalCost = Int(round(Double(mealCostInCents + mealTipInCents + mealTaxInCents) / 100.0))
    print("The total meal cost is \(totalCost) dollars.")
}


func loadHrChalenge2() {
    let line1 = Double(readLine()!)!
    let line2 = Int(readLine()!)!
    let line3 = Int(readLine()!)!
    
    hrChallenge2(mealCost: line1, tip: line2, tax: line3)
}

// hrChallenge2(mealCost: 12.00, tip: 20, tax: 8)


//------------------------

func candyReplenishingRobot(initialCandies: Int, time: Int, cx: [Int]) {
    var candiesAdded = 0
    var bowl = initialCandies
    
    for i in 0..<time {
        bowl -= cx[i]
        if bowl < 5 {
            if i != time - 1 {
                let addCandies = initialCandies - bowl
                bowl += addCandies
                candiesAdded += addCandies
            }
        }
    }
    print(candiesAdded)
}

//candyReplenishingRobot(initialCandies: 8, time: 4, cx: [3, 1, 7, 5])

func candyReplenishingRobotLoader() {
    let line1 = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let n = line1[0]
    let t = line1[1]
    let line2 = (readLine()!.components(separatedBy: " ").map{ Int($0)! })
    
    candyReplenishingRobot(initialCandies: n, time: t, cx: line2)
}

// ----------------------------------
