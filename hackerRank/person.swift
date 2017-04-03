//
//  classes.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

// Class vs Instance

class Person {
    var age: Int
    
    init(initialAge: Int) {
        if initialAge < 0 {
            age = 0
            print("Age is not valid, setting age to 0.")
        } else {
            age = initialAge
        }
    }
    
    func yearPasses() {
        age += 1
    }
    
    func amIOld() {
        switch age {
        case 0..<13:
            print ("You are young.")
        case 13..<18:
            print ("You are a teenager.")
        default:
            print ("You are old.")
        }
    }
}

//func personLoader() {
let t = Int(readLine()!)!

for _ in 0..<t {
    let age = Int(readLine()!)!
    let p = Person(initialAge: age)
    
    p.amIOld()
    
    for _ in 1...3 {
        p.yearPasses()
    }
    
    p.amIOld()
    
    print("")
}
