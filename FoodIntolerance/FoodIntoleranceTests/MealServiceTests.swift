//
//  MealServiceTests.swift
//  FoodIntoleranceTests
//
//  Created by Claire Erba on 4/25/20.
//  Copyright © 2020 Claire Erba. All rights reserved.
//

import XCTest
@testable import FoodIntolerance

class MealServiceTests: XCTestCase {
    var systemUnderTest: MealService!
    
    override func setUp() {
        self.systemUnderTest = MealService()
    }

    override func tearDown() {
        self.systemUnderTest = nil
    }

    func testAPI_returnsSuccessfulResult() throws {
        //Given
        var meals: [Meal]!
        var error: Error?
        
        let promise = expectation(description: "Completion handler is invoked")
        
        //When
        self.systemUnderTest.getMeals(completion: { data, shouldntHappen in
            meals = data
            error = shouldntHappen
            promise.fulfill()
        })
        
        wait(for: [promise], timeout: 5)
        
        //Then
        XCTAssertNotNil(meals)
        XCTAssertNil(error)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
