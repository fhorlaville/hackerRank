//
//  substringQueries.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation


func substringQueries(first: String, second: String) {
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    
    var answer = 0
    
    main: for l in 0..<firstLength {
        let currentLength = firstLength - l
        let maxStart = firstLength - currentLength
        for start in 0...maxStart {
            
            let begin = first.index(first.startIndex, offsetBy: start)
            let end = first.index(first.startIndex, offsetBy: start + currentLength)
            let range = begin..<end
            
            let subString = first.substring(with: range)
            
            if second.range(of:subString) != nil{
                answer = currentLength
                break main
            }
        }
    }
    print(answer)
}

func substringQueries2(first: String, second: String) {
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    
    var answer = 0
    
    main: for len in 0..<firstLength {
        let currentLength = firstLength - len
        let maxStart = firstLength - currentLength
        for start in 0...maxStart {
            var subString = ""
            let stop = start+currentLength
            
            for i in start..<stop {
                subString.append(firstChars[i])
            }
            
            if second.range(of:subString) != nil{
                answer = currentLength
                break main
            }
        }
    }
    print(answer)
}

func substringQueries3(first: String, second: String) {
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    
    var answer = 0
    
    main: for len in 0..<firstLength {
        let currentLength = firstLength - len
        let maxStart = firstLength - currentLength
        for start in 0...maxStart {
            let stop = start+currentLength
            let subString = String(firstChars[start..<stop])
            
            if second.range(of:subString) != nil{
                answer = currentLength
                break main
            }
        }
    }
    print(answer)
}

func substringQueries4(first: String, second: String) {
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    
    let secondChars = [Character](second.characters)
    let secondLength = secondChars.count
    
    var answer = 0
    
    main: for len in 0..<firstLength {
        let currentLength = firstLength - len
        let maxStart = firstLength - currentLength
        let maxStart2 = secondLength - currentLength
        
        for start in 0...maxStart {
            let stop = start + currentLength
            let findArray = firstChars[start..<stop]
            
            for start2 in 0...maxStart2 {
                let stop2 = start2 + currentLength
                if findArray == secondChars[start2..<stop2] {
                    answer = currentLength
                    break main
                }
            }
            
        }
    }
    print(answer)
}

func substringQueries5(first: String, second: String) {  // wrong
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    
    let secondChars = [Character](second.characters)
    let secondLength = secondChars.count
    
    var answer = 0
    
    main: for currentLength in 1..<firstLength {
        let maxStart = firstLength - currentLength
        let maxStart2 = secondLength - currentLength
        var found = false
        
        for start in 0...maxStart {
            let stop = start + currentLength
            let findArray = firstChars[start..<stop]
            
            for start2 in 0...maxStart2 {
                let stop2 = start2 + currentLength
                if findArray == secondChars[start2..<stop2] {
                    answer = currentLength
                    found = true
                    continue main
                }
            }
        }
        if !found {
            break main
        }
    }
    print(answer)
}


func substringQueries6(first: String, second: String) {
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    
    var answer = 0
    
    main: for currentLength in 1...firstLength {
        let maxStart = firstLength - currentLength
        for start in 0...maxStart {
            print("maxStart: \(maxStart)")
            let begin = first.index(first.startIndex, offsetBy: start)
            let end = first.index(first.startIndex, offsetBy: start + currentLength)
            let range = begin..<end
            
            let subString = first.substring(with: range)
            print(subString)
            if second.range(of:subString) != nil {
                answer = currentLength
                continue main
            }
        }
        break main
    }
    print(answer)
}

func substringQueries7(first: String, second: String) {
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    var currentSecond = second
    
    var answer = 0
    
    main: for currentLength in 1...firstLength {
        let maxStart = firstLength - currentLength
        for start in 0...maxStart {
            let begin = first.index(first.startIndex, offsetBy: start)
            let end = first.index(first.startIndex, offsetBy: start + currentLength)
            let range = begin..<end
            print("currentSecond: \(currentSecond)")
            
            let subString = first.substring(with: range)
            if let found = second.range(of:subString) {
                answer = currentLength
                currentSecond = second.substring(from: found.lowerBound)
                continue main
            }
        }
        break main
    }
    print(answer)
}

func substringQueries8(first: String, second: String) {
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    
    var secondChars = [Character](second.characters)
    let secondLength = secondChars.count
    
    var answer = 0
    
    main: for len in 0..<firstLength {
        let currentLength = firstLength - len
        let maxStart = firstLength - currentLength
        let maxStart2 = secondLength - currentLength
        
        for start in 0...maxStart {
            let stop = start + currentLength
            let findArray = firstChars[start..<stop]
            
            for start2 in 0...maxStart2 {
                let stop2 = start2 + currentLength
                if findArray == secondChars[start2..<stop2] {
                    answer = currentLength
                    break main
                }
            }
            
        }
    }
    print(answer)
}

func testLength(currentLength: Int, first:String, second: String) -> Bool {
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    
    var secondChars = [Character](second.characters)
    let secondLength = secondChars.count
    
    var answer = false
    
    let maxStart = firstLength - currentLength
    let maxStart2 = secondLength - currentLength
    
    main: for start in 0...maxStart {
        let stop = start + currentLength
        let findArray = firstChars[start..<stop]
        
        for start2 in 0...maxStart2 {
            let stop2 = start2 + currentLength
            if findArray == secondChars[start2..<stop2] {
                answer = true
                break main
            }
        }
    }
    return answer
}


func substringQueries9(first: String, second: String) {
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    //var currentSecond = second
    
    var answer = 0
    
    var currentLength = 1
    var previousLength = firstLength
    
    var minLength = 1
    var maxLength = firstLength
    
    var finish = false
    
    while !finish {
        previousLength = currentLength
        currentLength = (minLength + maxLength ) / 2
        if testLength(currentLength: currentLength, first:first, second: second) {
            answer = max(currentLength, answer)
            minLength = currentLength
        } else {
            maxLength = currentLength
        }
        finish = (previousLength == currentLength)
        print(minLength, maxLength, answer)
    }
    print(answer)
}

func dpSubstringQueries(first: String, second: String) {
    let firstChars = [Character](first.characters)
    let firstLength = firstChars.count
    
    let secondChars = [Character](second.characters)
    let secondLength = secondChars.count
    
    var lengths: [[Int]] = Array(repeating: Array(repeating: 0, count: secondLength + 1), count: firstLength + 1)
    var answer = 0
    
    for i in 1...firstLength {
        for j in 1...secondLength {
            if firstChars[i-1] == secondChars[j-1] {
                if i == 1 || j == 1 {
                    lengths[i][j] = 1
                } else {
                    lengths[i][j] = lengths[i-1][j-1] + 1
                }
                if lengths[i][j] > answer {
                    answer = lengths[i][j]
                }
            } else {
                lengths[i][j] = 0
            }
        }
    }
    print(answer)
}

//dpSubstringQueries(first: "z", second: "probieren")
//dpSubstringQueries(first: "n", second: "probieren")
//dpSubstringQueries(first: "birkerem", second: "probieren")
//dpSubstringQueries(first: "birkerem", second: "sadasment")
//dpSubstringQueries(first: "probieren", second: "sadasment")
//dpSubstringQueries(first: "probieren", second: "lmdjvujufnhrhvuirjmnrjivirmrmjhydydiopprobierejmtjuvgnfnrjifbiermngjifkmndfiifkjksadasmentwwwvvgbrgrbrb")
//dpSubstringQueries(first: "birkerem", second: "birkerem")
//dpSubstringQueries(first: "fnhrhvuirjmnrjivirmrmjhydydiop", second: "lmdjvujufnhrhvuirjmnrjivirmrmjhydydiopprobierejmtjuvgnfnrjifbiermngjifkmndfiifkjksadasmentwwwvvgbrgrbrb")

//import Foundation

func substringQueriesLoader() {
    
    let line0 = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let stringCount = line0[0]
    let queries = line0[1]
    
    var strings: [String]=[]
    for _ in 0..<stringCount {
        strings.append(readLine()!)
    }
    
    for _ in 0..<queries {
        let query = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        let string1 = strings[query[0]]
        let string2 = strings[query[1]]
        if string1.characters.count < string2.characters.count {
            substringQueries(first: string1, second: string2)
        } else {
            substringQueries(first: string2, second: string1)
            
        }
    }
}

//substringQueriesLoader()

