//
//  MealService.swift
//  MealIntolerance
//
//  Created by Claire Erba on 4/14/20.
//  Copyright © 2020 Claire Erba. All rights reserved.
//

import Foundation

enum MealCallingError: Error {
    case problemGeneratingURL
    case problemGettingDataFromAPI
    case problemDecodingData
}

class MealService {
    
    private let urlString = "http://www.mocky.io/v2/5ea4e9443000008150ce2dea"
    //private let urlString = "http://www.mocky.io/v2/5ea7794b2f00003f33c4ec8c"
    
    func getMeals(completion: @escaping ([Meal]?, Error?) -> ()) {
        
        guard let url = URL(string: self.urlString) else {
            DispatchQueue.main.async { completion(nil, MealCallingError.problemGeneratingURL) }
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async { completion(nil, MealCallingError.problemGettingDataFromAPI) }
                    return
            }
            do {
                let mealResult = try JSONDecoder().decode(MealResult.self, from: data)
                DispatchQueue.main.async { completion(mealResult.meals, nil) }
            }
            catch (let error) {
                print(error)
                DispatchQueue.main.async { completion(nil, MealCallingError.problemDecodingData) }
            }
        }
        task.resume()
    }
}

