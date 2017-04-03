//
//  flatLandSpaceStations.swift
//  hackerRank
//
//  Created by Franck Horlaville on 03/04/2017.
//  Copyright © 2017 TAM Software. All rights reserved.
//

import Foundation

func flatLandSpaceStations(numberOfCities: Int, numberOfStations:Int, citiesWithStations:[Int]){
    var cities = Array(repeating: numberOfCities - 1, count: numberOfCities)
    
    for i in 0..<numberOfCities {
        if citiesWithStations.contains(i) {
            cities[i] = 0
        }
    }
    
    print(cities)
    var currentDistance = numberOfCities - 1
    for i in 0..<numberOfCities {
        if(cities[i]) == 0 {
            currentDistance = 0
        } else {
            currentDistance += 1
            cities[i] = min(cities[i], currentDistance)
        }
    }
    print(cities)
    
    currentDistance = numberOfCities - 1
    for i in 0..<numberOfCities {
        if(cities[numberOfCities - i - 1]) == 0 {
            currentDistance = 0
        } else {
            currentDistance += 1
            cities[numberOfCities - i - 1] = min(cities[numberOfCities - i - 1], currentDistance)
        }
    }
    print(cities)
    let maxDistance = cities.max()!
    print(maxDistance)
    
}

//flatLandSpaceStations(numberOfCities: 5, numberOfStations:2, citiesWithStations:[0, 4])
//flatLandSpaceStations(numberOfCities: 6, numberOfStations:6, citiesWithStations:[0, 1, 2, 3, 4, 5])
//flatLandSpaceStations(numberOfCities: 12, numberOfStations:1, citiesWithStations:[0])
//flatLandSpaceStations(numberOfCities: 12, numberOfStations:1, citiesWithStations:[3])

func loadFlatlandSpaceStations() {
    let settings = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    let numberOfCities = settings[0]
    let numberOfStations = settings[1]
    let citiesWithStations = (readLine()!.components(separatedBy: " ").map{ Int($0)! }).sorted(by: { $0 > $1 })
    
    flatLandSpaceStations(numberOfCities: numberOfCities, numberOfStations:numberOfStations, citiesWithStations:citiesWithStations)
}


