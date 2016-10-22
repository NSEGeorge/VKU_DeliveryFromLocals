//
//  ViewController.swift
//  DeliveryFromLocals
//
//  Created by Georgij on 03.10.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import UIKit

private let segueIdentifier = "OpenGeneralCity"

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Variables
    var json = JSONParser.init().json
    var cities = [CityModel]()
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesTableViewCell", for: indexPath) as! CitiesTableViewCell
        cell.setupCell(name: self.cities[indexPath.row].cityName!, imageLink: self.cities[indexPath.row].cityImageLink ?? "defaultCity.png")
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: segueIdentifier, sender: indexPath.row)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let vc = segue.destination as? CategoryViewController {
                
                if let index = sender as? Int {
                    let food = self.cities[index].foodArray
                    vc.title = self.cities[index].cityName
                    vc.food = food
                }
            }
        }
    }
    
    func parseJSON() {
        if let cities = self.json?["cities"].array {
            for element in cities {
                let city = CityModel.init(dict: element)
                self.cities.append(city)
            }
        }
    }
}

extension CitiesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        self.tableView.register(UINib.init(nibName: "CitiesTableViewCell", bundle: nil), forCellReuseIdentifier: "CitiesTableViewCell")
        
        self.parseJSON()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
