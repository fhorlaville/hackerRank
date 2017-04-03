//
//  WeekOfCode30.swift
//  hackerRank
//
//  Created by Franck Horlaville on 15/03/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func myMin(_ number: Int ) -> String {
    if number == 1  {
        return "int"
    } else {
        return "min(int, " + myMin (number - 1) + ")"
    }
}

// print(myMin(4))



//----------------------------

func myPass(n: Int, vowel:Bool = false, currentString: String = "") {
    
    let vowels = ["a", "e", "i", "o", "u"]
    let consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
    
    if currentString == "" {
        for letter in vowels {
            myPass ( n: n - 1, vowel: true, currentString: currentString + letter)
        }
        for letter in consonants {
            myPass ( n: n - 1, vowel: false, currentString: currentString + letter)
        }
    } else {
        if n == 0 {
            print ("\(currentString)")
        } else {
            if vowel {
                for letter in consonants {
                    myPass ( n: n - 1, vowel: !vowel, currentString: currentString + letter)
                }
            } else {
                for letter in vowels {
                    myPass ( n: n - 1, vowel: !vowel, currentString: currentString + letter)
                }
            }
        }
    }
    
}

//myPass(n: 1)
//print("---")
//myPass(n: 2)
//print("---")
//myPass(n: 3)
//print("---")
//myPass(n: 4)
//print("---")
//myPass(n: 5)
//print("---")
//myPass(n: 6)


func loadmyPass() {
    let n = Int(readLine()!)!
    myPass(n: n)
    
}

//----------------------------

func camelCase(s: String) -> Int {
    
    var result = 1
    for character in s.characters {
        print(character)
        if character >= "A" && character <= "Z" {
            result += 1
        }
    }
    return result
}


func loadCamelCase() {
    let s = readLine()!
    print(camelCase(s: s))
}

//------------------------------

func rangeModularQuery(a:[Int], n: Int, left: Int, right: Int, x:  Int, y:  Int) {
    var found = 0
    for i in 0..<n {
        if i < left {
            continue
        }
        if i > right {
            break
        }
        if a[i] % x == y {
            found += 1
        }
    }
    print(found)
}

//rangeModularQuery(a:[250, 501, 5000, 5, 4], n: 5, left: 0, right: 4, x:  5, y:  0)
//rangeModularQuery(a:[250, 501, 5000, 5, 4], n: 5, left: 0, right: 4, x:  10, y:  0)
//rangeModularQuery(a:[250, 501, 5000, 5, 4], n: 5, left: 0, right: 4, x:  3, y:  2)

func rangeModularQueryLoader() {
    let line0 = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let n = line0[0]
    let q = line0[1]
    let a = readLine()!.components(separatedBy: " ").map{ Int($0)! }//.sorted(by: { $0 > $1 })
    
    for _ in 0..<q {
        let line = (readLine()!.components(separatedBy: " ").map{ Int($0)! })
        rangeModularQuery(a: a, n: n, left: line[0], right: line[1], x:  line[2], y:  line[3])
    }
}
