//
//  RegisterHeaderView.swift
//  FangZai
//
//  Created by ktrade on 2020/3/24.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class RegisterHeaderView: UICollectionReusableView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    let titleLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.textColor = #colorLiteral(red: 0.3914129734, green: 0.4063842595, blue: 0.4852036834, alpha: 1)
        lab.font = UIFont.boldSystemFont(ofSize: 25)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let subTitleLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.textColor = #colorLiteral(red: 0.3914129734, green: 0.4063842595, blue: 0.4852036834, alpha: 1)
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    func setupLayout() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5).isActive = true
        subTitleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        subTitleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
