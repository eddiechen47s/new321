//
//  ResourceDonateViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/18.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class ResourceDonateViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = #colorLiteral(red: 0.9721714854, green: 0.9801152349, blue: 1, alpha: 1)
        setupLayout()
    }

    let titleLabel: UILabel = {
          let lab = UILabel()
           lab.font = UIFont.boldSystemFont(ofSize: 25)
           lab.text = "資源入庫"
           lab.backgroundColor = .clear
           lab.textAlignment = .center
           lab.translatesAutoresizingMaskIntoConstraints = false
           return lab
       }()
       
       func setupLayout() {
           addSubview(titleLabel)

           titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
           titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
           titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
           titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
       }
}
