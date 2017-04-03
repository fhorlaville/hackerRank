//
//  gameOfNumbers.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func play(n: Int, integers: [Int], player: [[Int]]){
    var results: [Int] = Array(repeating: 0, count: n)
    
    for _ in 0..<10000 {
        var call = 0
        for i in 0..<n-1 {
            call += 1 + player[i][Int(arc4random_uniform(UInt32(integers[i])))]
        }
        for i in 0..<n {
            if (call + i + 1) % n == 0 {
                results[i]+=1
            }
        }
    }
    print(results)
    
}

//play(n: 3, integers: [1, 1], player: [[1], [2]])
//play(n: 3, integers: [2, 1], player: [[1, 2], [3]])

func loaderGameOfNumbers() {
    var players = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let n = players[0]
    players.removeFirst()
    
    var player:[[Int]]=[]
    for _ in 0..<n {
        player.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
    }
    play(n: n, integers: players, player: player)
}
