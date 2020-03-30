//
//  UltravioletViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/5.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class UltravioletViewCell: UITableViewCell {

    @IBOutlet weak var views: UIView!
    @IBOutlet weak var uviNumLabel: UILabel!
    @IBOutlet weak var uviLevelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        views.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        views.layer.borderWidth = 0.5
        views.layer.cornerRadius = 8
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
