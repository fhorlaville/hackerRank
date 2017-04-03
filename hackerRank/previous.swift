//
//  previous.swift
//  hackerRank
//
//  Created by Franck Horlaville on 12/03/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation



func challenge3() {
    //import Foundation
    
    // read the integer n
    let n = Int(readLine()!)!
    
    // declare 2d array
    var arr: [[Int]] = []
    
    // read array row-by-row
    for _ in 0..<n {
        arr.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
    }
    
    var primary = 0
    var secondary = 0
    
    for i in 0..<n {
        primary += arr [i][i]
        secondary += arr [i][n-i-1]
    }
    
    print(abs(primary - secondary))
}
// ==============






func coinChange() {
    
    
    let settings = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    let targetValue = settings[0]
    let coinTypes = settings[1]
    var coinValues = (readLine()!.components(separatedBy: " ").map{ Int($0)! }).sorted(by: { $0 > $1 })
    
    var solutionsArray: [[Int]] = []
    
    func value( coins: [Int]) -> Int {
        var total = 0
        
        for (index, coinQty) in coins.enumerated() {
            total += coinQty * coinValues[index]
        }
        
        return total
    }
    
    func remain( initial: Int, coins: [Int]) -> Int {
        return initial - value(coins: coins)
    }
    
    func isInSolutionsArray(attempt: [Int]) -> Bool {
        var answer = false
        for solution in solutionsArray {
            if attempt == solution {
                answer = true
                break
            }
        }
        return answer
    }
    
    var attempt = Array(repeating: 0, count: coinTypes)
    
    if value(coins: attempt) == targetValue {
        if !isInSolutionsArray(attempt: attempt) {
            solutionsArray.append(attempt)
        }
    }
    
    
    print(solutionsArray.count)
    print (coinValues)
    
    for currentCoin in 0..<coinTypes {
        for i in 0..<targetValue {
            attempt = [0,0,0,i]
            print(value(coins: attempt))
            
        }
    }
}


//coinChange()




func calculateEquals(interns: Int, chocolates: [Int]) {
    
    // let values = Array(Set(chocolates)).sorted()
    let funcs = [1,2,5]
    // var currentMin = values.min()
    // var currentMax = values.max()
    
    // print(values, currentMin, currentMax)
    
    
    var steps = 0
    var reached = false
    var newChocolates = chocolates.sorted()
    
    print(newChocolates)
    print("---")
    
    while !reached {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: funcs.count), count: interns)
        var lookup = [Int: [Int]]()
        
        var maxFoundValue = 0
        var maxFoundIntern:Int = -1
        var maxFoundF:Int = -1
        
        steps += 1
        
        for intern in 0..<interns {
            if let stored = lookup[newChocolates[intern]] {
                matrix[intern] = stored
            } else {
                var matrixAfterAdd:[[Int]] = Array(repeating: Array(repeating: 0, count: funcs.count), count: interns)
                for i in 0..<interns {
                    let startValue = Array(repeating: newChocolates[i], count: funcs.count)
                    if i == intern {
                        matrixAfterAdd[i] = startValue
                    } else {
                        matrixAfterAdd[i] = zip(startValue, funcs).map(+)
                    }
                }
                
                //                print(matrixAfterAdd)
                
                var equalities = Array(repeating: 0, count: funcs.count)
                
                for f in 0..<funcs.count {
                    var counting = [Int: Int]()
                    for i in 0..<interns {
                        let currentCounting = (counting[matrixAfterAdd[i][f]] ?? 0)
                        counting[matrixAfterAdd[i][f]] = currentCounting + 1
                        if currentCounting > maxFoundValue {
                            maxFoundValue = currentCounting
                            maxFoundIntern = i
                            maxFoundF = f
                        }
                        
                    }
                    equalities[f] = counting.values.max()!
                    if equalities[f] == 1 { equalities[f] = 0 }
                    if equalities[f] == interns {
                        reached = true
                        //need a fallthrough of some kind
                    }
                }
                
                lookup[newChocolates[intern]] = equalities
                matrix[intern] = equalities
            }
        }
        //        print("---")
        //        print(matrix)
        //        print("")
        
        // we now have the matrix of equalities after applying all the possible additions
        // we will now apply the operation giving the highest number of equalities
        
        for intern in 0..<interns {
            if intern != maxFoundIntern {
                newChocolates[intern] += funcs[maxFoundF]
            }
        }
        print("Intern: \(maxFoundIntern) + \(funcs[maxFoundF]) - \(maxFoundValue) equalities")
        print(newChocolates)
        print("---")
    }
    
    print (steps)
}


func hcEquals(line1:String, line2: String) {
    
    let interns = Int(line1)!
    let  startValues = line2.components(separatedBy: " ").map{ Int($0)! }
    
    calculateEquals(interns: interns, chocolates: startValues)
}

func hcEqualsWrapper() {
    
    let testCases = Int(readLine()!)!
    for _ in 0..<testCases {
        let interns = Int(readLine()!)!
        let  startValues = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        
        calculateEquals(interns: interns, chocolates: startValues)
    }
}

//calculateEquals(interns: 4, chocolates: [2,2,3,7])

//hcEquals(line1:"110", line2: "53 361 188 665 786 898 447 562 272 123 229 629 670 848 994 54 822 46 208 17 449 302 466 832 931 778 156 39 31 777 749 436 138 289 453 276 539 901 839 811 24 420 440 46 269 786 101 443 832 661 460 281 964 278 465 247 408 622 638 440 751 739 876 889 380 330 517 919 583 356 83 959 129 875 5 750 662 106 193 494 120 653 128 84 283 593 683 44 567 321 484 318 412 712 559 792 394 77 711 977 785 146 936 914 22 942 664 36 400 857")
/*
 82
 520 862 10 956 498 956 991 542 523 664 378 194 76 90 753 868 837 830 932 814 616 78 103 882 452 397 899 488 149 108 723 22 323 733 330 821 41 322 715 917 986 93 111 63 535 864 931 372 47 215 539 15 294 642 897 98 391 796 939 540 257 662 562 580 747 893 401 789 215 468 58 553 561 169 616 448 385 900 173 432 115 712
 199
 761 706 697 212 97 845 151 637 102 165 200 34 912 445 435 53 12 255 111 565 816 632 534 617 18 786 790 802 253 502 602 15 208 651 227 305 848 730 294 303 895 846 337 159 291 125 565 655 380 28 221 549 13 107 166 31 245 308 185 498 810 139 865 370 790 444 27 639 174 321 294 421 168 631 933 811 756 498 467 137 878 40 686 891 499 204 274 744 512 460 242 674 599 108 396 742 552 423 733 79 96 27 852 264 658 785 76 415 635 895 904 514 935 942 757 434 498 32 178 10 844 772 36 795 880 432 537 785 855 270 864 951 649 716 568 308 854 996 75 489 891 331 355 178 273 113 612 771 497 142 133 341 914 521 488 147 953 26 284 160 648 500 463 298 568 31 958 422 379 385 264 622 716 619 800 341 732 764 464 581 258 949 922 173 470 411 672 423 789 956 583 789 808 46 439 376 430 749 151
 161
 134 415 784 202 34 584 543 119 701 7 700 959 956 975 484 426 738 508 201 527 816 136 668 624 535 108 1 965 857 152 478 344 567 262 546 953 199 90 72 900 449 773 211 758 100 696 536 838 204 738 717 21 874 385 997 761 845 998 78 703 502 557 47 421 819 945 375 370 35 799 622 837 924 834 595 24 882 483 862 438 221 931 811 448 317 809 561 162 159 640 217 662 197 616 435 368 562 162 739 949 962 713 786 238 899 733 263 781 217 477 220 790 409 383 590 726 192 152 240 352 792 458 366 341 74 801 709 988 964 800 938 278 514 76 516 413 810 131 547 379 609 119 169 370 502 112 448 695 264 688 399 408 498 765 749 925 918 458 913 234 611
 51
 512 125 928 381 890 90 512 789 469 473 908 990 195 763 102 643 458 366 684 857 126 534 974 875 459 892 686 373 127 297 576 991 774 856 372 664 946 237 806 767 62 714 758 258 477 860 253 287 579 289 496
 */

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


func calcEuler6(n: Int){
    var sums = 0
    var squares = 0
    var difference = 0
    
    for i in 1...n {
        sums += i
        squares += (i*i)
    }
    sums = sums*sums
    difference = abs(sums - squares)
    print(difference)
}

//let testCases = Int(readLine()!)!
//for _ in 0..<testCases {
//    let n = Int(readLine()!)!
//    calcEuler6(n:n)
//}



func calcEuler13(numberOfStrings: Int, hugeIntStrings: [String]) {
    
    let answerLength = 10
    
    //let strLength = hugeIntStrings[0].count //should be 50
    let strLength = 50
    var result = Array(repeating: 0, count: strLength)
    var remainder = 0
    for x in 0..<strLength {
        var tempResult = remainder
        var strPosition = strLength-x-1
        for y in 0..<numberOfStrings {
            let theString = hugeIntStrings[y]
            let theChar = theString[theString.index(theString.startIndex, offsetBy: strPosition)]
            tempResult+=Int(String(theChar))!
        }
        result[strPosition] = tempResult % 10
        remainder = (tempResult - result[strPosition]) / 10
    }
    
    var answer = String(remainder)
    var remainderLength = answer.characters.count
    for i in 0..<answerLength - remainderLength {
        answer+=String(result[i])
    }
    print(answer)
}




//calcEuler13(numberOfStrings: 5, hugeIntStrings: [
//    "37107287533902102798797998220837590246510135740250",
//    "46376937677490009712648124896970078050417018260538",
//    "74324986199524741059474233309513058123726617309629",
//    "91942213363574161572522430563301811072406154908250",
//    "23067588207539346171171980310421047513778063246676"])

func prepCalcEuler13() {
    
    let n = Int(readLine()!)!
    var s = [String]()
    
    for _ in 0..<n {
        s.append(readLine()!)
    }
    
    calcEuler13(numberOfStrings: n, hugeIntStrings: s)
}


