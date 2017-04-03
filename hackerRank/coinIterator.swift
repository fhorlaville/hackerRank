//
//  coinIterator.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func coinIterator() {
    
    let targetValue = 200
    //    let coinValues = [2, 5, 3, 6].sorted(by: { $0 > $1 })
    let coinValues = [1, 5, 2, 10, 20, 50, 100, 200].sorted(by: { $0 > $1 })
    
    let dimensions = coinValues.count
    
    var minValues: [Int] = []
    var maxValues: [Int] = []
    
    for i in 0..<dimensions {
        minValues.append(0)
        maxValues.append(targetValue/coinValues[i])
    }
    
    func coinValue( coins: [Int]) -> Int {
        var total = 0
        
        for (index, coinQty) in coins.enumerated() {
            total += coinQty * coinValues[index]
        }
        
        return total
    }
    
    
    func nextValue(oldValue: [Int]) -> [Int] {
        var newValue = oldValue
        
        newValue[dimensions - 1] += 1
        
        for rouleau in stride(from: dimensions - 1, through: 0, by: -1) {
            if newValue[rouleau] > maxValues[rouleau]  || coinValue(coins: newValue) > targetValue {
                newValue[rouleau] = 0
                if rouleau > 0 {
                    newValue[rouleau - 1] += 1
                }
            }
        }
        if newValue == minValues {
            newValue = maxValues
        }
        return newValue
    }
    
    var solutions = 0
    
    var currentValue = minValues
    
    while currentValue != maxValues {
        currentValue = nextValue(oldValue: currentValue)
        //        print(currentValue, coinValue(coins: currentValue))
        if coinValue(coins: currentValue) == targetValue {
            solutions += 1
            print(currentValue, coinValue(coins: currentValue))
            //            print("---", solutions, "---")
        }
    }
    print(solutions)
    
}

//coinIterator()


func coinIterator2(targetValue: Int) {
    
    //    let coinValues = [2, 5, 3, 6].sorted(by: { $0 > $1 })
    let coinValues = [1, 5, 2, 10, 20, 50, 100, 200].sorted(by: { $0 > $1 })
    
    let dimensions = coinValues.count
    
    var minValues: [Int] = []
    var maxValues: [Int] = []
    
    for i in 0..<dimensions {
        minValues.append(0)
        maxValues.append(targetValue/coinValues[i])
    }
    
    func coinValue( coins: [Int]) -> Int {
        var total = 0
        
        for (index, coinQty) in coins.enumerated() {
            total += coinQty * coinValues[index]
        }
        
        return total
    }
    
    
    func nextValue(oldValue: [Int]) -> [Int] {
        var newValue = oldValue
        
        newValue[dimensions - 1] += 1
        
        for rouleau in stride(from: dimensions - 1, through: 0, by: -1) {
            if newValue[rouleau] > maxValues[rouleau]  || coinValue(coins: newValue) > targetValue {
                newValue[rouleau] = 0
                if rouleau > 0 {
                    newValue[rouleau - 1] += 1
                }
            }
        }
        if newValue == minValues {
            newValue = maxValues
        }
        return newValue
    }
    
    var solutions = 0
    
    var currentValue = minValues
    
    while currentValue != maxValues {
        currentValue = nextValue(oldValue: currentValue)
        //        print(currentValue, coinValue(coins: currentValue))
        if coinValue(coins: currentValue) == targetValue {
            solutions += 1
            print(currentValue, coinValue(coins: currentValue))
            //            print("---", solutions, "---")
        }
    }
    print(solutions)
    
}


func dynamicCoinIterator(target: Int, coins: [Int]) {
    //    let coins = [1, 5, 2, 10, 20, 50, 100, 200].sorted()
    let coins = coins.sorted()
    let differentCoins = coins.count
    var matrix = Array(repeating: Array(repeating: 0, count: differentCoins), count: target+1)
    
    print("  ", terminator:" ")
    for x in 0..<differentCoins {
        print("\(coins[x])", terminator:" ")
    }
    print()
    
    for y in 0...target {
        //matrix[y][0] = (y >= coins[0] && y % coins[0] == 0 ? 1 : 0)
        matrix[y][0] = (y % coins[0] == 0 ? 1 : 0)
        print("\(y): \(matrix[y][0])", terminator:" ")
        for x in 1..<differentCoins {
            matrix[y][x] += matrix[y][x-1] + (y >= coins[x] ? matrix[y-coins[x]][x] : 0)
            print(matrix[y][x], terminator:" ")
        }
        print()
    }
    print(matrix[target][differentCoins-1])
    
}

//dynamicCoinIterator(target: 4, coins: [1,2,3])
//dynamicCoinIterator(target: 10, coins: [2, 5, 3, 6])
//dynamicCoinIterator(target: 200, coins: [1, 5, 2, 10, 20, 50, 100, 200])
