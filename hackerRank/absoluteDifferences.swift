//
//  absoluteDifferences.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func challenge3() {
    //import Foundation
    
    // read the integer n
    let n = Int(readLine()!)!
    
    // declare 2d array
    var arr: [[Int]] = []
    
    // read array row-by-row
    for _ in 0..<n {
        arr.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
    }
    
    var primary = 0
    var secondary = 0
    
    for i in 0..<n {
        primary += arr [i][i]
        secondary += arr [i][n-i-1]
    }
    
    print(abs(primary - secondary))
}
