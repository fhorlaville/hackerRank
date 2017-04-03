//
//  poles.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation



func move(poles:[(Int,Int)], from: Int, to: Int) -> Int {
    var cost = 0
    for i in from..<to {
        cost += poles[i].1 * (poles[i].0 - poles[to].0)
    }
    
    return cost
}


func polesChallenge(n: Int, stacks: Int, poles:[(Int,Int)]) {
    var cost = 0
    if stacks == 1 {
        cost += move(poles: poles, from: 0, to: n-1)
    }
    print(cost)
}

//polesChallenge(n:3, stacks: 1, poles: [(40,1), (30,1), (20,1)])
//polesChallenge(n:6, stacks: 2, poles: [(32,1), (30,10), (18,13), (16,18), (12,17), (10,15)])

func polesChallengeLoader() {
    let line0 = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let n = line0[0]
    let stacks = line0[1]
    
    var poles:[(Int,Int)] = []
    
    for _ in 0..<n {
        let line = (readLine()!.components(separatedBy: " ").map{ Int($0)! })
        poles.insert((line[0], line[1]), at:0)
    }
    
    
    polesChallenge(n: n, stacks: stacks, poles: poles)
}
