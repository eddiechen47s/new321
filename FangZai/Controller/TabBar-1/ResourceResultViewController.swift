//
//  ResourceResultViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/12.
//  Copyright © 2020 Swift. All rights reserved.
//  防救災資源-防救災資源總覽

import UIKit

class ResourceResultViewController: UIViewController {

    var collecionViewFlowlayout: UICollectionViewFlowLayout!
    
    let cellId = "ResourceResultCell"
    let headerId = "headerId"
    
    
    let itemAr = [Classification(image: "iconDisasterPreventionEquipment", title: "防災設備"),
                  Classification(image: "iconDisasterPreventionMaterial", title: "防災器具"),
                  Classification(image: "iconEmergencyRefugeEquipment", title: "緊急避難設備"),
                  Classification(image: "iconReserveItem", title: "儲備物品"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        setupLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ResourceResultViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    func setupLayout() {
        view.addSubview(collectionView)

        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


extension ResourceResultViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemAr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ResourceResultViewCell
        cell.backgroundColor = .red
        cell.titleLabel.text = itemAr[indexPath.row].title
        cell.centerImage.image = UIImage(named: itemAr[indexPath.row].image)?.withRenderingMode(.alwaysOriginal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itmeSize = CGSize(width: (view.frame.width / 2) - 8, height: view.frame.height / 2)
        
        return itmeSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
//        header.largeContentTitle
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height / 10)
    }
}
