//
//  timeConversion.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func timeConversion(){
    
    // Read the string
    let s = readLine()!
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "hh:mm:ssaa"
    
    let date = dateFormatter.date(from: s)
    
    dateFormatter.dateFormat = "HH:mm:ss"
    let date24 = dateFormatter.string(from: date!)
    
    print(date24)
}
