//
//  MealTest.swift
//  FoodIntoleranceTests
//
//  Created by Claire Erba on 4/25/20.
//  Copyright © 2020 Claire Erba. All rights reserved.
//

import XCTest
@testable import FoodIntolerance

class MealTest: XCTestCase {

    func testMealDebugDescription() throws {
        let meal = Meal(
            name: "Chicken",
            ingredients: "4 Chicken Breasts, Salt, Pepper, Lemon", makesSick: false,
            symptoms: "None!",
            mealDates: "04/22/2020 17:15",
            imageUrl: "https://www.spendwithpennies.com/wp-content/uploads/2018/08/SpendWithPennies-Oven-Baked-Chicken-Breast-22.jpg"
        )

        let actualValue = meal.debugDescription

        let expectedValue = "Meal[name: Chicken, ingredients: 4 Chicken Breasts, Salt, Pepper, Lemon, makesSick: false]"
        XCTAssertEqual(actualValue, expectedValue)
    }

}

