//
//  Planet.swift
//  SolarSystem
//
//  Created by Nicolas Garaycochea on 11/12/22.
//

import Foundation

class Planet {
    let name: String
    let planetDescription: String
    let imageName: String
    let orderNumber: Int
    let dayLengthInDays: Double
    let yearLengthInDays: Int
    let radiusInMiles: Double
    let moonCount: Int
    let ringCount: Int
    let planetType: String
    let distanceFromSun: Double
    var favorite: Bool

    init(name: String, planetDescription: String, imageName: String, orderNumber: Int,  dayLengthInDays: Double, yearLengthInDays: Int, radiusInMiles: Double, moonCount: Int, ringCount: Int, planetType: String, distanceFromSun: Double, favorite: Bool) {
        self.name = name
        self.planetDescription = planetDescription
        self.imageName = name.lowercased()
        self.orderNumber = orderNumber
        self.dayLengthInDays = dayLengthInDays
        self.yearLengthInDays = yearLengthInDays
        self.radiusInMiles = radiusInMiles
        self.moonCount = moonCount
        self.ringCount = ringCount
        self.planetType = planetType
        self.distanceFromSun = distanceFromSun
        self.favorite = favorite
    }
}

enum PlanetType: String {
    case iceGiant = "Ice Giant"
    case gasGiant = "Gas Giant"
    case terrestrial = "Terrestrial"
}

enum PlanetOrder: Int {
    case mercury = 1
    case venus = 2
    case earth = 3
    case mars = 4
    case jupiter = 5
    case saturn  = 6
    case uranus = 7
    case neptune = 8
}

extension Planet : Equatable {}

func ==(lhs: Planet, rhs: Planet) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.planetDescription != rhs.planetDescription {return false}
    if lhs.imageName != rhs.imageName {return false}
    if lhs.orderNumber != rhs.orderNumber {return false}
    if lhs.dayLengthInDays != rhs.dayLengthInDays {return false}
    if lhs.yearLengthInDays != rhs.yearLengthInDays {return false}
    if lhs.radiusInMiles != rhs.radiusInMiles {return false}
    if lhs.moonCount != rhs.moonCount {return false}
    if lhs.ringCount != rhs.ringCount {return false}
    if lhs.planetType != rhs.planetType {return false}
    if lhs.distanceFromSun != rhs.distanceFromSun {return false}
    
    return true
}
