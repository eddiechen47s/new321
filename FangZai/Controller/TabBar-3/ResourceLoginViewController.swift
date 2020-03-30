//
//  ResourceLoginViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/18.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class ResourceLoginViewController: UIViewController {
    
  
    fileprivate let cellId = "ResourceAccessCell"
    
    let titleAr = ["資源入庫","勸募品項","使用合約"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupLayout()
    }
  
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
        
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    func setupCollectionView() {
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ResourceAccessViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        
        collectionView.setAnchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 15, paddingRight: 0)

    }
}

extension ResourceLoginViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ResourceAccessViewCell
        cell.titleLabel.text = titleAr[indexPath.row]
        
        
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        cell.contentView.layer.borderWidth = 0.5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 減去 collectionView.setAnchor 設定時 constraint 的左右兩邊
        let itemSize = CGSize(width: (view.safeAreaLayoutGuide.layoutFrame.width) - 20 - 20, height: collectionView.frame.height / 3)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 20
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.item
        
        switch index {
        case 0:
            print(index)
            pushResourceStorageView()
        case 1:
            print(index)
            pushRaisedItemsView()
        default:
            print(index)
            pushUseContractView()
        }
    }
}


extension ResourceLoginViewController {
    func pushResourceStorageView() {
        let controller =  self.storyboard?.instantiateViewController(withIdentifier: "ResourceStorageVC") as! ResourceStorageViewController
        
        self.navigationController?.pushViewController(controller, animated:true)
    }
    
    func pushRaisedItemsView() {
           let controller =  self.storyboard?.instantiateViewController(withIdentifier: "RaisedItemsVC") as! RaisedItemsViewController
           
           self.navigationController?.pushViewController(controller, animated:true)
       }
    
    func pushUseContractView() {
           let controller =  self.storyboard?.instantiateViewController(withIdentifier: "UseContractVC") as! UseContractViewController
           
           self.navigationController?.pushViewController(controller, animated:true)
       }
}
