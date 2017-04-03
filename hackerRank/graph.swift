//
//  graph.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation


func graphProblem (vertices: Int, links: [(Int,Int)]) {
    
    
    var triangles: [(Int, Int, Int)] = []
    
    for _ in 0..<vertices {
        
    }
    
    for first in links {
        var level2 = links
        
        for index2 in 0..<level2.count {
            if first == level2[index2] {
                level2.remove(at: index2)
                break
            }
        }
        
        for second in level2 {
            var level3 = level2
            
            for index3 in 0..<level3.count {
                if second == level3[index3] {
                    level3.remove(at: index3)
                    break
                }
            }
            
            for third in level3 {
                let tempSet: Set<Int> = [first.0, first.1, second.0, second.1, third.0, third.1]
                if tempSet.count == 3 {
                    var trianglePoints:[Int]=[]
                    for a in tempSet {
                        trianglePoints.append(a)
                    }
                    trianglePoints = trianglePoints.sorted()
                    let newTriangle = (trianglePoints[0], trianglePoints[1], trianglePoints[2])
                    
                    for oldTriangle in triangles {
                        if oldTriangle == newTriangle {
                            triangles.append(newTriangle)
                            break
                        } else {
                            print(oldTriangle, newTriangle)
                        }
                    }
                    
                }
            }
            
        }
        
    }
    
    print(triangles)
}

func testGraphProblemLoader () {
    let vertices = 6
    let grid = [ "0 1 1 0 0 0",
                 "1 0 1 1 0 0",
                 "1 1 0 1 0 0",
                 "0 1 1 0 1 1",
                 "0 0 0 1 0 1",
                 "0 0 0 1 1 0" ]
    
    var links: [(Int,Int)] = []
    
    for j in 0..<vertices {
        let line = (grid[j].components(separatedBy: " ").map{ Int($0)! })
        for i in 0..<j {
            if line[i] == 1 {
                links.append((i, j))
            }
        }
    }
    graphProblem (vertices: vertices, links: links)
}

func graphProblemLoader () {
    let vertices = Int(readLine()!)!
    var links: [(Int,Int)] = []
    
    for j in 0..<vertices {
        let line = (readLine()!.components(separatedBy: " ").map{ Int($0)! })
        for i in 0..<j {
            if line[i] == 1 {
                links.append((i, j))
            }
        }
    }
    graphProblem (vertices: vertices, links: links)
}

//testGraphProblemLoader ()
