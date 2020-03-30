//
//  WeatherViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/5.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class AirViewCell: UITableViewCell {

    @IBOutlet weak var views: UIView!
    @IBOutlet weak var airDataLabel: UILabel!
    @IBOutlet weak var airTextLabel: UILabel!
    @IBOutlet weak var airImage: UIImageView!
    @IBOutlet weak var airTitleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        views.layer.borderWidth = 0.5
        views.layer.cornerRadius = 8

       
        
        if airTextLabel.text!.count < 3 {
            airTextLabel.textAlignment = .center
//            airTextLabel.leadingAnchor.constraint(equalTo: airDataLabel.trailingAnchor, constant: 10).isActive = true
        }
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
}


extension AirViewCell {
    
}
