//
//  ResourceDonateViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/18.
//  Copyright © 2020 Swift. All rights reserved.
//  HomeViewController

import UIKit

class ResourceDonateViewController: UIViewController {
    
    fileprivate let cellId = "ResourceDonateCell"
    let titleAr = ["即時捐贈","捐贈合約"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupLayout()
        
    }

    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ResourceDonateViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 15, paddingRight: 0)
        
    }
}


extension ResourceDonateViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ResourceDonateViewCell
        cell.titleLabel.text = titleAr[indexPath.row]
        
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        cell.contentView.layer.borderWidth = 0.5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: (view.safeAreaLayoutGuide.layoutFrame.width) - 20 - 20, height: collectionView.frame.height / 2.5)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            pushDonateView()
        } else {
            pushContractView()
        }
    } 
}


extension ResourceDonateViewController {
    func pushDonateView() {
        let controller =  self.storyboard?.instantiateViewController(withIdentifier: "DonateInstantlyVC") as! InstantlyDonateViewController
        
        self.navigationController?.pushViewController(controller, animated:true)
    }
    
    func pushContractView() {
        let controller =  self.storyboard?.instantiateViewController(withIdentifier: "DonateContractVC") as! DonateContractViewController
        
        self.navigationController?.pushViewController(controller, animated:true)
    }
}
