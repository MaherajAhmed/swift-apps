//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Ahmed, Maheraj (HWTA) on 19/11/2019.
//  Copyright © 2019 Ahmed, Maheraj (HWTA). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {

    func testTamagotchiWithNoArguementsReturnsNoNilObject() {
        //arrange
        //act
        let tamagotchi = Tamagotchi()
        //assert
        XCTAssertNotNil(tamagotchi)
    
    }
    
}
