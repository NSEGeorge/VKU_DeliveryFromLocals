//
//  ViewController.swift
//  DeliveryFromLocals
//
//  Created by Georgij on 03.10.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Open General City" {
            if let vc = segue.destination as? CategoryViewController {
                if let title = sender as? String {
                    vc.title = title
                }
            }
        }
    }
    
    // MARK: Actions
    @IBAction func moscowBtnPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "Open General City", sender: "Moscow")
    }
    
    @IBAction func parisBtnPressed(sender: AnyObject) {
        performSegue(withIdentifier: "Open General City", sender: "Paris")
    }
    
    @IBAction func barcelonaBtnPressed(sender: AnyObject) {
        performSegue(withIdentifier: "Open General City", sender: "Barcelona")
    }
    
    @IBAction func milanBtnPressed(sender: AnyObject) {
        performSegue(withIdentifier: "Open General City", sender: "Milan")
    }
    
    @IBAction func brusselsBtnPressed(sender: AnyObject) {
        performSegue(withIdentifier: "Open General City", sender: "Brussels")
    }
}

extension CitiesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
