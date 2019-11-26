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
    
    
    func testTamagotchiEatIncreasesWeight() {
        //arrange
        let tamagotchi = Tamagotchi()
        let inputData = 5
        let expected = 6
        //act
        let actual = tamagotchi.eatsnack(inputData: inputData)
        
        //assert
        XCTAssertEqual(actual,expected)
    }
    
}
