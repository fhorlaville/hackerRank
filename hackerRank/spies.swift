//
//  spies.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func grid2String(_ grid: [[Bool]]) -> String {
    var gridAsString = ""
    let k = grid.count
    
    for j in 0..<k {
        for i in 0..<k {
            if grid[j][i] {
                gridAsString.append("S")
            } else {
                gridAsString.append("S")
            }
            if i != k-1 {
                gridAsString.append(" ")
            }
        }
        if j != k-1 {
            gridAsString.append("\n")
        }
    }
    return gridAsString
}



func grid2SingleString(_ grid: [[Bool]]) -> String {
    var gridAsString = ""
    let k = grid.count
    
    for j in 0..<k {
        for i in 0..<k {
            if grid[j][i] {
                gridAsString.append("\(j+1)")
                break
            }
        }
        if j != k-1 {
            gridAsString.append(" ")
        }
    }
    return gridAsString
    
}


func grid2String(_ positions: [Int]) -> String {
    var gridAsString = ""
    let k = positions.count
    
    for j in 0..<k {
        for _ in 0..<positions[j] {
            gridAsString.append("* ")
        }
        gridAsString.append("S")
        if positions[j] != k {
            gridAsString.append(" ")
        }
        for i in positions[j]+1..<k {
            gridAsString.append("*")
            if i != k-1 {
                gridAsString.append(" ")
            }
        }
        gridAsString.append("\n")
    }
    return gridAsString
}

func win(_ positions: [Int]) -> Bool {
    let n = positions.count
    
    for i in 0..<n {
        for j in i+1..<n {
            if positions[i] == positions[j] {
                return false
            }
        }
    }
    for i in 1..<n {
        if positions[i] == positions[i-1] + 1 ||
            positions[i] == positions[i-1] - 1 {
            return false
        }
    }
    
    for i in 0..<n-2 {
        for j in i..<n-1 {
            for k in j..<n {
                if (positions[i] == positions[j] + j &&
                    positions[j] == positions[k] + k) ||
                    (positions[i] == positions[j] - j &&
                        positions[j] == positions[k] - k){
                    return false
                }
            }
        }
    }
    
    for i in 0..<n-2 {
        for j in 0..<n {
            if (positions[i] == positions[i+1] - j &&
                positions[i+1] == positions[i+2] - j) ||
                (positions[i] == positions[i+1] + j &&
                    positions[i+1] == positions[i+2] + j) {
                return false
            }
        }
        
    }
    
    
    for i in 0..<n-2 {
        for j in 1..<(n-i)/2 {
            if positions[i] - positions[i+j] ==  positions[i+j] - positions[i+j+j] {
                return false
            }
        }
    }
    
    
    return true
    
    
}

//main: for n in 11...1000 {
//    var positions: [Int] = Array(repeating: 0, count:n)
//
//    while !win(positions) {
//        positions[0] += 1
//        for i in 0..<n {
//
//            if positions[i] == n {
//                positions[i] = 0
//                if i != n-1 {
//                    positions[i+1] += 1
//                } else {
//                    print("No Solution at \(n)")
//                    continue main
//                }
//            }
//        }
//    }
//
//    print(n)
//    for i in 0..<n {
//        print("\(positions[i]+1) ", terminator: "")
//    }
//    print("")
//    print(grid2String(positions))
//}



main: for n in 11...1000 {
    var positions: [Int] = Array(repeating: 0, count:n)
    
    while !win(positions) {
        positions[0] += 1
        for i in 0..<n {
            
            if positions[i] == n {
                positions[i] = 0
                if i != n-1 {
                    positions[i+1] += 1
                } else {
                    print("No Solution at \(n)")
                    continue main
                }
            }
        }
    }
    
    print(n)
    for i in 0..<n {
        print("\(positions[i]+1) ", terminator: "")
    }
    print("")
    print(grid2String(positions))
}

