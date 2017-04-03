//
//  main.swift
//  hackerRank
//
//  Created by Franck Horlaville on 10/03/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//


import Foundation

func popcount(_ countMe:Int ) -> Int {
    var wip = countMe
    var total = 0
    
    while(wip > 0) {
        wip &= (wip - 1)
        total += 1
    }
    return total
}


func counter(_ n:Int) {
    let answers = ["Richard", "Louise"]
    var answer = 0
    
    answer = popcount(n-1) & 1
    
    print(answers[answer])
}

func loadCounter() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        counter(n)
    }
}

for i in 1...33 {
    print(i, popcount(i))
}

//loadCounter()
