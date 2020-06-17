//
//  ViewController.swift
//  FoodIntolerance
//
//  Created by Claire Erba on 4/13/20.
//  Copyright © 2020 Claire Erba. All rights reserved.
//

import UIKit

class FoodListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var foods: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.foods = ["Spaghet"]
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}

extension FoodListViewController: UITableViewDataSource {
    //MARK: Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "foodCell")!
        cell.textLabel?.text = self.foods[indexPath.row]
        return cell
    }
}

extension FoodListViewController: UITableViewDelegate {
    //MARK: Delegate
}
