//
//  WelecomeViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/20.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class WelecomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9802859426, green: 0.9804533124, blue: 0.9802753329, alpha: 1)
        setupLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //隨時隱藏 NavigationBar
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //標題
    let titleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Statecraft Tech"
        lab.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        lab.textAlignment = .center
        lab.font = UIFont.boldSystemFont(ofSize: 25)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    //副標題
    let subTitleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "區塊鏈防救災物資溯源管理平台"
        lab.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 22)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    //登入 View
    lazy var loginView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //登入 UILabel
    let loginTitleLabel: UILabel = {
       let lab = UILabel()
        lab.text = "已經有帳戶了嗎？"
        lab.backgroundColor = .clear
        lab.font = UIFont.boldSystemFont(ofSize: 14)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    //登入 Button
    let loginBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("登入", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    //註冊 View
    lazy var registeredView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setupShadow(view: view)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //註冊 Button
    let registeredBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("開始註冊", for: .normal)
        
        btn.setTitleColor(UIColor.black,for: .normal)
        btn.addTarget(self, action: #selector(registeredAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    //主畫面 Pic
    let mainImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "welecomeImage"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    @objc func loginAction() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        
        UIWindow.key?.rootViewController = UINavigationController(rootViewController: controller)
        UIWindow.key?.makeKeyAndVisible()
    }
    
    @objc func registeredAction() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        UIWindow.key?.rootViewController = UINavigationController(rootViewController: controller)
        UIWindow.key?.makeKeyAndVisible()
    }
    
    
    func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(loginView)
        loginView.addSubview(loginTitleLabel)
        loginView.addSubview(loginBtn)
        view.addSubview(registeredView)
        registeredView.addSubview(registeredBtn)
        view.addSubview(mainImage)
        
        titleLabel.setAnchor(top: view.safeTopAnchor, left: view.safeLeftAnchor, bottom: nil, right: view.safeRightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        //
        subTitleLabel.setAnchor(top: titleLabel.bottomAnchor, left: view.safeLeftAnchor, bottom: nil, right: view.safeRightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        //
        mainImage.setAnchor(top: view.safeTopAnchor, left: view.safeLeftAnchor, bottom: view.safeBottomAnchor, right: view.safeRightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -40, paddingRight: 0)
        //
        loginView.setAnchor(top: nil, left: view.safeLeftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -30, paddingRight: 20, width: 0, height: view.frame.height / 17)
        //
        loginTitleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor, constant: -10).isActive = true
        loginTitleLabel.centerYAnchor.constraint(equalTo: loginView.centerYAnchor).isActive = true
        loginTitleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        loginTitleLabel.heightAnchor.constraint(equalTo: loginView.heightAnchor, multiplier: 1).isActive = true
        //
        loginBtn.setAnchor(top: loginTitleLabel.topAnchor, left: loginTitleLabel.rightAnchor, bottom: loginTitleLabel.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: -10, paddingBottom: 0, paddingRight: 0, width: 50, height: 0)
       //
        registeredView.setAnchor(top: nil, left: view.safeLeftAnchor, bottom: loginView.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -10, paddingRight: 20, width: 0, height: view.frame.height / 17)
        //
        registeredBtn.centerXAnchor.constraint(equalTo: registeredView.centerXAnchor).isActive = true
        registeredBtn.centerYAnchor.constraint(equalTo: registeredView.centerYAnchor).isActive = true
        registeredBtn.widthAnchor.constraint(equalTo: registeredView.widthAnchor, multiplier: 1).isActive = true
        registeredBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}


