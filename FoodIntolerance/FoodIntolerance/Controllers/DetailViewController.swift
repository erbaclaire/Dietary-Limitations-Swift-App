//
//  DetailViewController.swift
//  FoodIntolerance
//
//  Created by Claire Erba on 4/20/20.
//  Copyright © 2020 Claire Erba. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var symptomsLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealDatesLabel: UILabel!
    
    var meal: Meal!
    var mealImage: UIImage!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mealImageView.image = self.mealImage
        self.mealNameLabel.text = self.meal.name
        self.ingredientsLabel.text = self.meal.ingredients
        self.symptomsLabel.text = self.meal.symptoms
        self.mealDatesLabel.text = self.meal.mealDates
        // print(meal)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
