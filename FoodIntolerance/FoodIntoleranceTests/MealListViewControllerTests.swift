//
//  MealListViewControllerTests.swift
//  FoodIntoleranceTests
//
//  Created by Claire Erba on 4/25/20.
//  Copyright © 2020 Claire Erba. All rights reserved.
//

import XCTest
@testable import FoodIntolerance

class MealListViewControllerTests: XCTestCase {
    var systemUnderTest: MealListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        self.systemUnderTest = navigationController.topViewController as? MealListViewController
        
        UIApplication.shared.windows
            .filter { $0.isKeyWindow }
            .first!
            .rootViewController = self.systemUnderTest
        
        XCTAssertNotNil(navigationController.view)
        XCTAssertNotNil(self.systemUnderTest.view)
    }

    func testTableView_loadsMeals() throws {
        //Given
        let mockMealService = MockMealService()
        let mockMeals = [
            Meal(name: "Cheetos", ingredients: "Cheese Dust, Styrafoam", makesSick: true, symptoms: "Nausea", mealDates: "04/23/2020 11:15\n 04/24/2020 13:30", imageUrl: "https://fakecheetos/cheetos"),
            Meal(name: "Lasagna", ingredients: "Riccoto, Lasagna Noodles, Tomato Sauce", makesSick: true, symptoms: "Nausea, Diarrhea", mealDates: "04/23/2020 17:45\n 04/24/2020 18:30", imageUrl: "https://fakelasagna/lasagna"),
            Meal(name: "Ice Cream", ingredients: "Vanilla Ice Cream, Cherry, Hot Fudge, Rainbow Sprinkles", makesSick: true, symptoms: "Diarrhea", mealDates: "04/23/2020 21:45", imageUrl: "https://fakeicecream/vanilla")
        ]
        mockMealService.mockMeals = mockMeals
        
        self.systemUnderTest.viewDidLoad()
        self.systemUnderTest.mealService = mockMealService
        
        XCTAssertEqual(0, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
        
        //When
        self.systemUnderTest.viewWillAppear(false)
        
        //Then
        XCTAssertEqual(mockMeals.count, self.systemUnderTest.meals.count)
        XCTAssertEqual(mockMeals.count, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
    }
    
    class MockMealService: MealService {
        var mockMeals: [Meal]?
        var mockError: Error?
        
        override func getMeals(completion: @escaping ([Meal]?, Error?) -> ()) {
            completion(mockMeals, mockError)
        }
    }


}
