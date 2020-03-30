//
//  RegisterViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/24.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let needReliefCell = "NeedReliefCell"
    let donorCell = "donorCell"
    let headerId = "headerId"
    let sectionAr = ["校園","社區"]
    let sectionPAr = ["個人 / 廠商"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupCollectionView()
        setNavBarToTheView()
        
    }
    
    // 設置 NavigationBar
    func setNavBarToTheView() {
        let leftBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icArrowBack"), style: .plain, target: self, action: #selector(clickBacks))
        leftBarItem.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        navigationItem.leftBarButtonItem = leftBarItem
        view.backgroundColor = .white
        self.navigationItem.title = "註冊"
        //改變 titleColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)]
        //固定 NavigationBar 恆在
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func clickBacks() {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "WelecomeVC") as! WelecomeViewController
        
        UIWindow.key?.rootViewController = controller
        UIWindow.key?.makeKeyAndVisible()
        
        UIView.animate(withDuration: 0.5) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    let titleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "請選擇註冊身份"
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    func setupLayout() {
        //        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        
        collectionView.setAnchor(top: view.safeTopAnchor, left: view.safeLeftAnchor, bottom: view.safeBottomAnchor, right: view.safeRightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        let reliefNib = UINib(nibName: "NeedReliefViewCell", bundle: nil)
        let donorNib = UINib(nibName: "donorViewCell", bundle: nil)
        
        collectionView.register(reliefNib, forCellWithReuseIdentifier: needReliefCell)
        collectionView.register(donorNib, forCellWithReuseIdentifier: donorCell)
        collectionView.register(RegisterHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
}

extension RegisterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: needReliefCell, for: indexPath) as! NeedReliefViewCell
            cell.titleLabel.text = sectionAr[indexPath.row]
            setupShadow(view: cell)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: donorCell, for: indexPath) as! donorViewCell
        cell.titleLabel.text = sectionPAr[indexPath.row]
        setupShadow(view: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        
        if indexPath.section == 0 {
            switch index {
            case 0:
                pushRegisterSchoolView()
            default:
                pushRegisterCommunityView()
            }
        } else if indexPath.section == 1 {
            pushRegisterPersonView()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSize = CGSize(width: (view.frame.width / 2) - 20 , height: view.frame.height / 3)
        let newItemSize = CGSize(width: collectionView.frame.width, height: view.frame.height / 2.5)
        
        if indexPath.section == 0 {
            return itemSize
        } else {
            return newItemSize
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
    
}

//For headerView
extension RegisterViewController {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! RegisterHeaderView
        if indexPath.section == 0 {
            header.titleLabel.text = "請選擇註冊身份"
            header.subTitleLabel.text = "防救災單位"
        } else {
            header.titleLabel.text = "捐贈者"
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return .init(width: view.frame.width, height: view.frame.height / 10)
        }
        return .init(width: view.frame.width, height: view.frame.height / 25)
    }
    
    
    func setupShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 1.0
        view.clipsToBounds = false
        view.layer.masksToBounds = false
    }
}


extension RegisterViewController {
    func pushRegisterSchoolView() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterSchoolVC") as! RegisterSchoolViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func pushRegisterCommunityView () {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterCommunityVC") as! RegisterCommunityViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func pushRegisterPersonView () {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterPersonVC") as! RegisterPersonViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
