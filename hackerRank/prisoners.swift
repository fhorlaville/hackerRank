//
//  prisoners.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func prisoners(_ prisoners:Int, _ sweets:Int, _ starting:Int, expected: UInt64?) {
    var answer = 0;
    let remainingSweets = (sweets - 1 + starting) % prisoners
    
    
    if remainingSweets == 0 {
        answer = prisoners
    }
    else {
        answer = remainingSweets
    }
    print(answer)
    
}

func loadPrisoners() {
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let line0 = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        let n = line0[0]
        let m = line0[1]
        let s = line0[2]
        
        prisoners(n, m, s, expected:nil)
    }
    
}
