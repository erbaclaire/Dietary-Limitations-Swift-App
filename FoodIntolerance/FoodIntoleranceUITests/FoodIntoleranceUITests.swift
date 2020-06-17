//
//  FoodIntoleranceUITests.swift
//  FoodIntoleranceUITests
//
//  Created by Claire Erba on 4/13/20.
//  Copyright © 2020 Claire Erba. All rights reserved.
//

import XCTest

class FoodIntoleranceUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.tables.cells.element(boundBy: 0).tap()
        
        let mealsBackButton = app.navigationBars["FoodIntolerance.DetailView"].buttons["Meals"]
        
        XCTAssertTrue(mealsBackButton.exists)
        
        mealsBackButton.tap()
        
        XCTAssertFalse(mealsBackButton.exists)
        
        app.tables.cells.containing(.staticText, identifier:"Sushi").staticTexts["SAFE TO EAT"].tap()
        
        XCTAssertTrue(mealsBackButton.exists)
        
        app.navigationBars["FoodIntolerance.DetailView"].buttons["Meals"].tap()
        
        XCTAssertFalse(mealsBackButton.exists)
                
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
