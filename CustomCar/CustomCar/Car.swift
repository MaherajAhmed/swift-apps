//
//  Car.swift
//  CustomCar
//
//  Created by Ahmed, Maheraj (HWTA) on 10/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import Foundation

struct Car {
    var make: String
    var model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
     
    func displayStats() -> String {
        return """
        
        Make: \(make)
        Model: \(model)
        Top Speed: \(topSpeed)mph
        Acceleration (0-60 in): \(acceleration)
        Handling: \(handling)

        """
    }
}
