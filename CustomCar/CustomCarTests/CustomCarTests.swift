//
//  CustomCarTests.swift
//  CustomCarTests
//
//  Created by Ahmed, Maheraj (HWTA) on 10/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import XCTest
@testable import CustomCar

class CustomCarTests: XCTestCase {
    
    func testCarGetStatsAsPerPropertyValue() {
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 100, acceleration: 7.5, handling: 3)
        let expected = """

        Make: Mazda
        Model: MX-5
        Top Speed: 100mph
        Acceleration (0-60 in): 7.5
        Handling: 3

        """
        
        let actual = car.displayStats()

        XCTAssertEqual(actual, expected)
    }

}
