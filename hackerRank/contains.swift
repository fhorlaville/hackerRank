//
//  contains.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func challenge0() {
    
    if let line1 = readLine() {
        if let line2 = readLine(){
            
            if line2.components(separatedBy: " ").contains(line1) {
                print("YES")
            } else {
                print("NO")
            }
        }
    }
}
