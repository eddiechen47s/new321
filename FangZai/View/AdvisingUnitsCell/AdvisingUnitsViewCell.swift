//
//  AdvisingUnitsViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/12.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class AdvisingUnitsViewCell: UICollectionViewCell {

    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var location: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationImage.image = UIImage(named: "iconEarthquakeLocation")?.withRenderingMode(.alwaysOriginal)
        layer.cornerRadius = 10
    }

}
