//
//  WeathersViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/6.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class WeathersViewCell: UICollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
        
        weatherImage.image = UIImage(named: "iconWeatherCloud")?.withRenderingMode(.alwaysOriginal)
        
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            var frame = newValue

            frame.origin.x = 10

            frame.size.width -= 2 * frame.origin.x
            frame.size.height -= 2 * frame.origin.x

            self.layer.masksToBounds = true
            self.layer.cornerRadius = 8.0

            super.frame = frame
        }
    }

}
