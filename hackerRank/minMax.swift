//
//  minMax.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func minMax() {
    
    // read array and map the elements to integer
    let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    var min = Int.max
    var max = Int.min
    
    let n = arr.count
    
    for i in 0..<n {
        var sum = 0
        for j in 0..<n {
            if i != j { sum += arr[j] }
        }
        if sum < min { min = sum }
        if sum > max { max = sum }
    }
    
    print(min, max)
}
