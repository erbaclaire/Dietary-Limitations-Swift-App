//
//  Food.swift
//  FoodIntolerance
//
//  Created by Claire Erba on 4/14/20.
//  Copyright © 2020 Claire Erba. All rights reserved.
//

import Foundation

class Meal: CustomDebugStringConvertible, Codable {
    
    var debugDescription: String {
        return "Meal[name: \(self.name), ingredients: \(self.ingredients), makesSick: \(self.makesSick)]"
    }
    
    var name: String
    var ingredients: String
    var makesSick: Bool
    var symptoms: String
    var mealDates: String
    var imageUrl: String

    private enum CodingKeys: String, CodingKey {
        case name, ingredients, makesSick, symptoms, mealDates, imageUrl
    }
    
    init(name: String, ingredients: String, makesSick: Bool, symptoms: String, mealDates: String, imageUrl: String) {
        self.name = name
        self.ingredients = ingredients
        self.makesSick = makesSick
        self.symptoms = symptoms
        self.mealDates = mealDates
        self.imageUrl = imageUrl
    }
    
}

struct MealResult: Codable {
    let meals: [Meal]
}
