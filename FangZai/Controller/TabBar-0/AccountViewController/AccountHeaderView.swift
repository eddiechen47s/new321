//
//  AccountHeaderView.swift
//  FangZai
//
//  Created by ktrade on 2020/3/30.
//  Copyright © 2020 Swift. All rights reserved.
//

import Foundation
import UIKit

class AccountHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(titleImage)
        setupLayout()
    }
    
    let label: UILabel = {
        let lab = UILabel()
        lab.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        lab.font = UIFont.boldSystemFont(ofSize: 30)
        lab.numberOfLines = 0
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.textAlignment = .center
        return lab
    }()
    
    var titleImage: UIImageView = {
        let img = UIImageView()
        
        img.image = UIImage(named: "icPerson")?.withRenderingMode(.alwaysOriginal)
        img.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100.0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
            
            titleImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30.0),
            titleImage.trailingAnchor.constraint(equalTo: label.leadingAnchor,constant: 0),
            titleImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
        ])
    }
    
    func configure(text: String, image: UIImage) {
        label.text = text
        titleImage.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
