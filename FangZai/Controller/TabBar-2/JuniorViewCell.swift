//
//  JuniorViewCell.swift
//  FangZai
//
//  Created by ktrade on 2020/3/17.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class JuniorViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    let viewModel: [CountrySchoolModels] = [CountrySchoolModels(school: "縣立明倫國中"),
                     CountrySchoolModels(school: "縣立明倫國中"),
                      CountrySchoolModels(school: "縣立明倫國中")
    ]
    
    let data = DataLoader().userData
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SchoolCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SchoolCell
        let vm = viewModel[indexPath.row]
        cell.setupData(data: vm)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width / 2, height: collectionView.frame.height)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




class JuniorCell: UICollectionViewCell {
    
    func setupData(data: CountrySchoolModels) {
        titleLabel.text = data.school
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9489166141, green: 0.9490789771, blue: 0.9489063621, alpha: 1)
        layer.cornerRadius = 20
        
        setupLayout()
    }
    
    let titleLabel: UILabel = {
       let lab = UILabel()
//        lab.text = "123"
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let centerImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "centerImage")?.withRenderingMode(.alwaysOriginal)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let loactionImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "iconEarthquakeLocation")?.withRenderingMode(.alwaysOriginal)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
     let loactionLabel: UILabel = {
           let lab = UILabel()
            lab.text = "宜蘭縣 礁溪鄉"
            lab.font = UIFont.systemFont(ofSize: 10)
            lab.translatesAutoresizingMaskIntoConstraints = false
            return lab
        }()
    
    func setupLayout() {
        addSubview(titleLabel)
        addSubview(centerImage)
        addSubview(loactionImage)
        addSubview(loactionLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        centerImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        centerImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        centerImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        centerImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        loactionImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        loactionImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5).isActive = true
        loactionImage.widthAnchor.constraint(equalToConstant: 10).isActive = true
        loactionImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        loactionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        loactionLabel.leadingAnchor.constraint(equalTo: loactionImage.trailingAnchor,constant: 5).isActive = true
        loactionLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loactionLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func setupData(){
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


