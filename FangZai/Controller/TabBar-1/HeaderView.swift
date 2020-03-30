//
//  HeaderView.swift
//  FangZai
//
//  Created by ktrade on 2020/3/12.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // custom code for layout
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "主分類"
        lab.font = UIFont.systemFont(ofSize: 30)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let buttons: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("12345", for: .normal)
        btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupLayout() {
        addSubview(titleLabel)
//        addSubview(buttons)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        buttons.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        buttons.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 5).isActive = true
//        buttons.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        buttons.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func testAction() {
        print("test ok")
    }
    
}
