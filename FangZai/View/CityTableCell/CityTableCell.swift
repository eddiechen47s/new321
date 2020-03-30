//
//  CityTableCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/19.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class CityTableCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
       let lab = UILabel()
//        lab.font = UIFont.systemFont(ofSize: 10)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    func setupLayout() {
        addSubview(titleLabel)
        
        titleLabel.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0)
    }
    
}
