//
//  FoodCell.swift
//  FoodIntolerance
//
//  Created by Claire Erba on 4/14/20.
//  Copyright © 2020 Claire Erba. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealMakesSickLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    var mealImage: UIImage!
    var meal: Meal? {
        didSet {
            self.mealNameLabel.text = meal?.name
            if meal?.makesSick == false {
                self.mealMakesSickLabel.textColor = .systemGreen
                self.mealMakesSickLabel.text = "SAFE TO EAT"
            }
            else {
                self.mealMakesSickLabel?.textColor = .red
                self.mealMakesSickLabel.text = "NOT SAFE TO EAT"
            }
            DispatchQueue.global(qos: .userInitiated).async {
                if let mealImageData = NSData(contentsOf: URL(string: self.meal!.imageUrl)!) {
                    DispatchQueue.main.async {
                        self.mealImage = UIImage(data: mealImageData as Data)
                        self.mealImageView.image = self.mealImage
                        self.mealImageView.layer.cornerRadius = self.mealImageView.frame.width/2
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
