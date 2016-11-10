//
//  CategoryViewController.swift
//  DeliveryFromLocals
//
//  Created by Georgij on 03.10.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CategoryTableViewCellDelegate, UISearchBarDelegate, UISearchControllerDelegate {
    
    // MARK: Variables
    var food: [FoodModel]?
    var searchFood: [FoodModel]?
    var searchController: UISearchController?
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    func setupSearchController() -> Void {
        self.searchController = UISearchController.init(searchResultsController: nil)
        self.searchController?.delegate = self
        self.searchController?.searchBar.delegate = self
        
        self.searchController?.hidesNavigationBarDuringPresentation = false
        self.searchController?.obscuresBackgroundDuringPresentation = false
        
        self.navigationItem.titleView = self.searchController?.searchBar
        
        self.definesPresentationContext = true
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchFood!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        cell.setupCellWithFood(food: searchFood![indexPath.row])
        cell.delegate = self
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: CategoryTableViewCellDelegate
    func buyFood(food: FoodModel) {
        let alert = UIAlertController.init(title: "Покупка", message: "Вы купили \(food.foodName!)", preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "Ok", style: .default) { (UIAlertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
//        let predicate = NSPredicate(format: "SELF.foodName contains[c] %@", searchBar.text!)
//        self.searchFood = self.food?.filter{predicate.evaluate(with: $0)}
        
        self.searchFood = self.food?.filter{food in food.foodName == searchBar.text}
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchFood = self.food
        tableView.reloadData()
    }
}

extension CategoryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(UINib.init(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        
        self.searchFood = self.food
        setupSearchController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
