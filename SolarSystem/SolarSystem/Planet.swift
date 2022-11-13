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

    init(name: String, planetDescription: String, imageName: String, orderNumber: Int,  dayLengthInDays: Double, yearLengthInDays: Int, radiusInMiles: Double, moonCount: Int, ringCount: Int, planetType: String, distanceFromSun: Double) {
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
