//
//  AdvisingUnitsViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/12.
//  Copyright © 2020 Swift. All rights reserved.
//  防救災資源-勸募單位

import UIKit

class AdvisingUnitsViewController: UIViewController {

    var collecionViewFlowlayout: UICollectionViewFlowLayout!
    
    let cellId = "AdvisingUnitsCell"

    
    let itmeAr = [SchoolModels(school: "縣立玉田國中", loaction: "宜蘭縣 礁溪鄉"),
    SchoolModels(school: "縣立成功國小", loaction: "宜蘭縣 羅東鄉"),
    SchoolModels(school: "縣立育英國小", loaction: "宜蘭縣 蘇澳鎮"),
    SchoolModels(school: "縣立大里國小", loaction: "宜蘭縣 頭城鎮"),
    SchoolModels(school: "縣立東興國小", loaction: "宜蘭縣 冬山鄉"),
    SchoolModels(school: "縣立國䕘國小", loaction: "宜蘭縣 壯園鄉"),
    SchoolModels(school: "縣立蘇澳國小", loaction: "宜蘭縣 蘇澳鎮"),
    SchoolModels(school: "縣立南安國小", loaction: "宜蘭縣 蘇澳鎮"),
    SchoolModels(school: "縣立同樂國小", loaction: "宜蘭縣 員山鄉")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.hidesBarsOnSwipe = true
        collectionView.backgroundColor = .white
        
        setupCollectionView()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "AdvisingUnitsViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //        cv.backgroundColor = .red
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    

}


extension AdvisingUnitsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itmeAr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AdvisingUnitsViewCell
        cell.schoolLabel.text = itmeAr[indexPath.row].school
        cell.location.text = itmeAr[indexPath.row].loaction
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itmeSize = CGSize(width: (view.frame.width / 2) - 16 - 16, height: view.frame.height / 4.5)
        
        return itmeSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
}
