//
//  ViewController.swift
//  FoodIntolerance
//
//  Created by Claire Erba on 4/13/20.
//  Copyright © 2020 Claire Erba. All rights reserved.
//

import UIKit
import Network

class MealListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var indicator = UIActivityIndicatorView()
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let transfrom = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        indicator.transform = transfrom
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    var meals: [Meal] = []
    var mealService: MealService!
    
    let networkMonitor = NWPathMonitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Network monitoring
        networkMonitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Connected")
            }
            else {
                DispatchQueue.main.async {
                    self.networkErrorAlert()
                    self.indicator.stopAnimating()
                    self.indicator.hidesWhenStopped = true
                }
             }
        }
        let queue = DispatchQueue.global(qos: .background)
        networkMonitor.start(queue: queue)
        
        // Do any additional setup after loading the view.
        self.mealService = MealService()
        self.tableView.dataSource = self
        self.tableView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Call API
        guard let confirmedService = self.mealService else { return }
        // Start activity indicator
        activityIndicator()
        indicator.startAnimating()
        indicator.backgroundColor = .white
        confirmedService.getMeals(completion: { meals, error in
            sleep(1)
            guard let meals = meals, error == nil else {
                return
            }
            self.meals = meals
            
            // Empty meals list alert
            if self.meals.count == 0 {
                let alert = UIAlertController(title: "No Meals!", message: "There are no meals. List empty.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            self.tableView.reloadData()
            
            // Stop activity indicator
            self.indicator.stopAnimating()
            self.indicator.hidesWhenStopped = true
        })
    }
    
    func networkErrorAlert() {
        let alert = UIAlertController(title: "Network Connection Error", message: "No Internet or cellular detected. If the app was just opened, meals will not load. If the app was in the middle of a session, meals appearing may not be up to date.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Use Without Internet", comment: "Ok action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? DetailViewController,
            let selectedIndexPath = self.tableView.indexPathForSelectedRow,
            let confirmedCell = self.tableView.cellForRow(at: selectedIndexPath) as? MealCell else { return }
        
        let confirmedMeal = confirmedCell.meal
        destination.meal = confirmedMeal
        let confirmedMealImage = confirmedCell.mealImage
        destination.mealImage = confirmedMealImage
    }
    
}

extension MealListViewController: UITableViewDataSource {
    //MARK: Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "mealCell") as! MealCell
        let currentMeal = self.meals[indexPath.row]
        cell.meal = currentMeal
        return cell
    }
}

extension MealListViewController: UITableViewDelegate {
    //MARK: Delegate
}

