//
//  loader.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

// hackerRank template for loader functions

import Foundation


func loader() {
    let line1 = Double(readLine()!)!
    let line2 = Int(readLine()!)!
    let line3 = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let a = line3[0]
    let b = line3[1]
    let line4 = (readLine()!.components(separatedBy: " ").map{ Int($0)! }).sorted(by: { $0 > $1 })

    //hrChallenge2(mealCost: line1, tip: line2, tax: line3)
}

//loader()
