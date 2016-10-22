//
//  CitiesTableViewCell.swift
//  DeliveryFromLocals
//
//  Created by Georgij on 13.10.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(name: String, imageLink: String) {
        self.cityNameLbl.text = name
        self.cityImageView.image = UIImage.init(named: imageLink)
    }
}
