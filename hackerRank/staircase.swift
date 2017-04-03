//
//  staircase.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func stairCase(){
    
    // read the integer n
    let n = Int(readLine()!)!
    
    // print the staircase
    
    for i in 1...n {
        print("".padding(toLength: n-i, withPad: " ", startingAt: 0).padding(toLength: n, withPad: "#", startingAt: 0))
    }
}
