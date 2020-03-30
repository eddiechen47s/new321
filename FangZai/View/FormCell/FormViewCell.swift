//
//  FormViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/10.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class FormViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dataLabel: UILabel!
    
//    var viewModel: EarthquakeModels {
//        didSet {
//            
//        }
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.borderWidth = 1
    }
    
}
