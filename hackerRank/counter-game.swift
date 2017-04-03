//
//  counter-game.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//


//https://www.hackerrank.com/challenges/counter-game

//Louise and Richard play a game. They have a counter set to . Louise gets the first turn and the turns alternate thereafter. In the game, they perform the following operations.
//
//If  is not a power of , reduce the counter by the largest power of  less than .
//If  is a power of , reduce the counter by half of .
//The resultant value is the new  which is again used for subsequent operations.
//The game ends when the counter reduces to 1, i.e., , and the last person to make a valid


import Foundation


//this is normally part of Swift 3.1 but can't get it to work so reproducing it
extension Int {
    var popcount: Int {
        get {
            let bits = 8 * MemoryLayout<Int>.size
            var total = 0
            var wip = self
            
            for _ in 0..<bits {
                if wip & 1 != 0 { total += 1 }
                wip = wip >> 1
            }
            return total
        }
    }
}


func counter(_ n:Int) {
    let answers = ["Richard", "Louise"]
    var answer = 0
    
    answer = (n-1).popcount & 1
    
    print(answers[answer])
}

//counter(1)
//counter(2)
//counter(6)

func loadCounter() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        counter(n)
    }
}


