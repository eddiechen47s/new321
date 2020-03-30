//
//  ResetFinishViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/26.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class ResetFinishViewController: UIViewController {
    
    let blackView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    func showView() {
        if let window = UIWindow.key {
            
            window.addSubview(blackView)
            window.addSubview(checkView)
            checkView.addSubview(textLabel)
            checkView.addSubview(backView)
            checkView.addSubview(backButton)
            
            checkView.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
            checkView.centerYAnchor.constraint(equalTo: window.centerYAnchor, constant: -160).isActive = true
            checkView.widthAnchor.constraint(equalTo: window.widthAnchor, multiplier: 0.9).isActive = true
            checkView.heightAnchor.constraint(equalTo: window.heightAnchor, multiplier: 0.25).isActive = true
            
            textLabel.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
            textLabel.centerYAnchor.constraint(equalTo: checkView.centerYAnchor, constant: -20).isActive = true
            textLabel.widthAnchor.constraint(equalTo: checkView.widthAnchor, multiplier: 1).isActive = true
            textLabel.heightAnchor.constraint(equalTo: checkView.heightAnchor, multiplier: 0.3).isActive = true
            
            backView.setAnchor(top: nil, left: checkView.leftAnchor, bottom: checkView.bottomAnchor, right: checkView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: 40)
            
            backButton.setAnchor(top: backView.topAnchor, left: backView.leftAnchor, bottom: backView.bottomAnchor, right: backView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.frame = window.bounds
            blackView.alpha = 0
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
                self.checkView.alpha = 1
            }
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            self.checkView.alpha = 0
        }
    }
    
    let checkView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.932934463, green: 0.940746367, blue: 0.9697087407, alpha: 1)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textLabel: UILabel = {
        let lab = UILabel()
        lab.text = "密碼重設已完成！"
        lab.backgroundColor = .clear
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.boldSystemFont(ofSize: 22)
        lab.textAlignment = .center
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    //返回 View
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9606800675, green: 0.9608443379, blue: 0.9606696963, alpha: 1)
        view.setupShadow(view: view)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //返回 Button
    lazy var backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("返回首頁登入", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func backAction() {

        pushLoginView()
    }
    
    func pushLoginView() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        
        UIWindow.key?.rootViewController = UINavigationController(rootViewController: controller)
        UIWindow.key?.makeKeyAndVisible()
    }
}
