//
//  euler6.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func calcEuler6(n: Int){
    var sums = 0
    var squares = 0
    var difference = 0
    
    for i in 1...n {
        sums += i
        squares += (i*i)
    }
    sums = sums*sums
    difference = abs(sums - squares)
    print(difference)
}

//let testCases = Int(readLine()!)!
//for _ in 0..<testCases {
//    let n = Int(readLine()!)!
//    calcEuler6(n:n)
//}

