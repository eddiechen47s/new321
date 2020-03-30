//
//  FormTableViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/10.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class FormTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //init frame
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
