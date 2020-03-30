//
//  HeaderCollectionView.swift
//  FangZai
//
//  Created by ktrade on 2020/3/16.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class HeaderCollectionView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    let titleLabel: UILabel = {
        let lab = UILabel()
//        lab.text = "主分類"
        lab.font = UIFont.systemFont(ofSize: 30)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let buttons: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("查看更多 >", for: .normal)
        btn.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupLayout() {
        addSubview(titleLabel)
        addSubview(buttons)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        buttons.topAnchor.constraint(equalTo: topAnchor).isActive = true
        buttons.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 5).isActive = true
        buttons.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttons.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func testAction() {
        print("test ok")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
