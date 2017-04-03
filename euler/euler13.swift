//
//  euler13.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func calcEuler13(numberOfStrings: Int, hugeIntStrings: [String]) {
    
    let answerLength = 10
    
    //let strLength = hugeIntStrings[0].count //should be 50
    let strLength = 50
    var result = Array(repeating: 0, count: strLength)
    var remainder = 0
    for x in 0..<strLength {
        var tempResult = remainder
        var strPosition = strLength-x-1
        for y in 0..<numberOfStrings {
            let theString = hugeIntStrings[y]
            let theChar = theString[theString.index(theString.startIndex, offsetBy: strPosition)]
            tempResult+=Int(String(theChar))!
        }
        result[strPosition] = tempResult % 10
        remainder = (tempResult - result[strPosition]) / 10
    }
    
    var answer = String(remainder)
    var remainderLength = answer.characters.count
    for i in 0..<answerLength - remainderLength {
        answer+=String(result[i])
    }
    print(answer)
}




//calcEuler13(numberOfStrings: 5, hugeIntStrings: [
//    "37107287533902102798797998220837590246510135740250",
//    "46376937677490009712648124896970078050417018260538",
//    "74324986199524741059474233309513058123726617309629",
//    "91942213363574161572522430563301811072406154908250",
//    "23067588207539346171171980310421047513778063246676"])

func prepCalcEuler13() {
    
    let n = Int(readLine()!)!
    var s = [String]()
    
    for _ in 0..<n {
        s.append(readLine()!)
    }
    
    calcEuler13(numberOfStrings: n, hugeIntStrings: s)
}

