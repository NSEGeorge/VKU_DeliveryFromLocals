//
//  CategoryTableViewCell.swift
//  DeliveryFromLocals
//
//  Created by Georgij on 19.10.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import UIKit

protocol CategoryTableViewCellDelegate {
    func buyFood(food: FoodModel)
}

class CategoryTableViewCell: UITableViewCell {

    private var food: FoodModel?
    
    var delegate: CategoryTableViewCellDelegate?
    
    // MARK: IBOutlets
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodDescriptionLbl: UILabel!
    @IBOutlet weak var foodBuyBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buyBtnPressed(_ sender: AnyObject) {
        delegate?.buyFood(food: self.food!)
    }
    
    func setupCellWithFood(food: FoodModel) {
        self.foodNameLbl.text = food.foodName
        self.foodDescriptionLbl.text = food.foodDescription
        self.foodImageView.image = UIImage.init(named: food.foodImageLink ?? "defaultCity.png")
        self.foodBuyBtn.setTitle("Buy \(food.foodPrice!)₽", for: .normal)
        
        self.food = food
    }
}
