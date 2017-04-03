//
//  score.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func challenge2() {
    // Enter your code here
    //import Foundation
    
    let alice = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let bob = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let scores = alice.count
    
    var aliceScore = 0
    var bobScore = 0
    
    for i in 0..<scores {
        if alice[i] > bob[i] {
            aliceScore += 1
        } else {
            if alice[i] < bob[i] {
                bobScore += 1
            }
        }
    }
    
    print(aliceScore, bobScore)
}
