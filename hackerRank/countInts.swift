//
//  countInts.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

// count and display number of negatives, positives and zeroes in a string of Ints

func challenge4() {
    //import Foundation
    
    // number of elements
    let n = Double(readLine()!)!
    
    
    // read array and map the elements to integer
    let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    var positives = 0.0
    var negatives = 0.0
    var zeroes = 0.0
    
    for i in arr {
        if i > 0 {
            positives += 1
        } else {
            if i<0 {
                negatives += 1
            } else {
                zeroes += 1
            }
        }
    }
    let positivesValue = positives / n
    let negativesValue = negatives / n
    let zeroesValue = zeroes / n
    
    print(String(format: "%.06f", positivesValue))
    print(String(format: "%.06f", negativesValue))
    print(String(format: "%.06f", zeroesValue))
    
}
