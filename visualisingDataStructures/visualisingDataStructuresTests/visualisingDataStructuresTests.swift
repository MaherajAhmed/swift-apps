//
//  visualisingDataStructuresTests.swift
//  visualisingDataStructuresTests
//
//  Created by Ahmed, Maheraj (HWTA) on 28/01/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import XCTest
@testable import visualisingDataStructures

class visualisingDataStructuresTests: XCTestCase {
    
    func testingPopFunctionToSeeIfValueIsReturned() {
        //arrange
        let stackDataStructure = StackDataStructure()
        stackDataStructure.push(item: 2)
        let expected = 2
        //act
        let actual = stackDataStructure.pop()
        //assert
        XCTAssertEqual(actual, expected)
        
        
    }

}
