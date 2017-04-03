//
//  euler1.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func calcEuler1_1(n: Int){
    
    var total = 0
    for i in 1..<n {
        if i%3 == 0 || i%5 == 0 {
            print(i)
            total += i
        }
    }
    print(total)
}

func calcEuler1_2(n: Int){
    var total = 0
    
    if n <= 3 {
        total = 0
    } else if n <= 5 {
        total = 3
    } else if n <= 6 {
        total = 8
    } else {
        var memory = [5, 3]
        total = 8
        
        for i in 6..<n {
            for item in memory {
                if i % item == 0 {
                    total += i
                    //print("found \(i) in \(memory)")
                    memory.insert(i, at: 0)
                    break
                }
            }
        }
    }
    print(total)
}

func calcEuler1_3(n: Int){
    var total = 0
    
    var list = Set<Int>()
    var maxI = n/3
    
    for i in 0...maxI {
        list.insert(3*i)
    }
    
    maxI = n/5
    for i in 0...maxI {
        list.insert(5*i)
    }
    
    list.remove(n)
    
    for item in list {
        //print("\(item) ", terminator: "")
        total += item
    }
    
    print(total)
}

func calcEuler1_4(n: Int){
    var total = 0
    
    var memory = Array(repeating: false, count: n)
    
    var a = 0
    
    var i = 1
    
    repeat {
        a = 3 * i
        i += 1
        
        if a < n && !memory[a] {
            total += a
            memory[a] = true
        }
        
    } while a < n
    
    i = 1
    repeat {
        a = 5 * i
        i += 1
        
        if a < n && !memory[a] {
            total += a
            memory[a] = true
        }
        
    } while a < n
    
    
    print(total)
}

func calcEuler1_5(n: Int){
    var total = 0
    
    var memory = [Int: Bool]()
    
    var a = 0
    
    var i = 1
    
    repeat {
        a = 3 * i
        i += 1
        
        if a < n && memory[a] == nil {
            total += a
            memory[a] = true
        }
        
    } while a < n
    
    i = 1
    repeat {
        a = 5 * i
        i += 1
        
        if a < n && memory[a] == nil {
            total += a
            memory[a] = true
        }
        
    } while a < n
    
    
    print(total)
}

func calcEuler1_6(n: Int){
    var total = 0
    var memory = [Int: Bool]()
    
    var a = 3
    while a < n {
        if memory[a] == nil {
            total += a
            memory[a] = true
        }
        a += 3
    }
    
    a = 5
    while a < n {
        if memory[a] == nil {
            total += a
            memory[a] = true
        }
        a += 5
    }
    
    print(total)
}

func calcEuler1_7(n: Int){
    var total = 0
    
    var a = 3
    while a < n {
        total += a
        a += 3
    }
    
    a = 5
    while a < n {
        total += a
        a += 5
    }
    
    a = 15
    while a < n {
        total -= a
        a += 15
    }
    
    print(total)
}

func calcEuler1_8(n: Int){
    var total = 0
    for num in 1..<n {
        
        if (num % 3 == 0) { total += num }
        else if (num % 5 == 0) { total += num }
    }
    print(total)
}

func calcEuler1_9(n: Int){
    var total = 0
    
    var i = 1
    while i < n {
        if i % 3 == 0{ total += i }
        if i % 5 == 0 { total += i }
        if i % 15 == 0 { total -= i }
        i += 1
    }
    
    print(total)
}

func calcEuler1_10(n: Int){
    var total = 0
    
    var a = 3
    var b = 5
    var c = 15
    
    let maxC = (n-1)/c
    let maxB = (n-1)/b
    let maxA = (n-1)/a
    
    if maxC > 0 {
        for _ in 1...maxC {
            total += a + b - c
            a += 3
            b += 5
            c += 15
        }
    }
    
    
    if maxB > 0 {
        for _ in maxC+1...maxB {
            total += a + b
            a += 3
            b += 5
        }
    }
    
    if maxA > 0 {
        for _ in maxB+1...maxA {
            total += a
            a += 3
        }
    }
    
    print(total)
}

func calcEuler1(n: Int){
    var total = 0;
    var p = (n-1)/3;
    total = ((3*p*(p+1))/2);
    
    p = (n-1)/5;
    total = total + ((5*p*(p+1))/2);
    
    p = (n-1)/15;
    total = total - ((15*p*(p+1))/2)
    print(total)
}

//for i in 1...9 {
//    var n = Int(NSDecimalNumber(decimal: pow(10, i)))
//
//    var t = clock()
////    calcEuler1_6(n:n)        // 23
////    t = clock() - t
////    print("        6: (10e\(i)): \(t) ticks - \(Double(t) / Double(CLOCKS_PER_SEC)) seconds")
//
//    t = clock()
//    calcEuler1_7(n:n)        // 23
//    t = clock() - t
//    print("        7: (10e\(i)): \(t) ticks - \(Double(t) / Double(CLOCKS_PER_SEC)) seconds")
//
////    t = clock()
////    calcEuler1_8(n:n)        // 23
////    t = clock() - t
////    print("        8: (10e\(i)): \(t) ticks - \(Double(t) / Double(CLOCKS_PER_SEC)) seconds")
////
////    t = clock()
////    calcEuler1_9(n:n)        // 23
////    t = clock() - t
////    print("        9: (10e\(i)): \(t) ticks - \(Double(t) / Double(CLOCKS_PER_SEC)) seconds")
//
//    t = clock()
//    calcEuler1_10(n:n)        // 23
//    t = clock() - t
//    print("       10: (10e\(i)): \(t) ticks - \(Double(t) / Double(CLOCKS_PER_SEC)) seconds")
//
//    t = clock()
//    calcEuler1(n:n)        // 23
//    t = clock() - t
//    print("       --: (10e\(i)): \(t) ticks - \(Double(t) / Double(CLOCKS_PER_SEC)) seconds")
//
//    print("=====")
//}



func euler1(){
    let testCases = Int(readLine()!)!
    for _ in 0..<testCases {
        let n = Int(readLine()!)!
        calcEuler1_1(n:n)
    }
}
