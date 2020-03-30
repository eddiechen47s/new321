//
//  CityHeaderView.swift
//  FangZai
//
//  Created by ktrade on 2020/3/18.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class CityHeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "區域選擇"
        lab.font = UIFont.systemFont(ofSize: 30)
        lab.textAlignment = .center
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let subTitleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "請點選區域"
        lab.font = UIFont.systemFont(ofSize: 15)
        lab.textAlignment = .center
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    
    
    func setupLayout() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        subTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        subTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    @objc func testAction() {
        print("test ok")
    }
    
}
