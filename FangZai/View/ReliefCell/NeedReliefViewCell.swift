//
//  NeedReliefViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/24.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class NeedReliefViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = #colorLiteral(red: 0.9721714854, green: 0.9801152349, blue: 1, alpha: 1)
        titleLabel.textColor = #colorLiteral(red: 0.3914129734, green: 0.4063842595, blue: 0.4852036834, alpha: 1)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }

}
