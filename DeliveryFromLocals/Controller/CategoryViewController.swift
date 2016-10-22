//
//  CategoryViewController.swift
//  DeliveryFromLocals
//
//  Created by Georgij on 03.10.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CategoryTableViewCellDelegate {
    
    // MARK: Variables
    var food: [FoodModel]?
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.food!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        cell.setupCellWithFood(food: food![indexPath.row])
        cell.delegate = self
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "", sender: indexPath.row)
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
}

extension CategoryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(UINib.init(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
