//
//  LoginViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/23.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBarToTheView()
        setupLayout()
        keyboardHides()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // 設置 NavigationBar
    func setNavBarToTheView() {
        let leftBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icArrowBack"), style: .plain, target: self, action: #selector(onClickBack))
        leftBarItem.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        navigationItem.leftBarButtonItem = leftBarItem
        view.backgroundColor = .white
        self.navigationItem.title = "登入"
        //改變 titleColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)]
        //固定 NavigationBar 恆在
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func onClickBack() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "WelecomeVC") as! WelecomeViewController
        
        UIWindow.key?.rootViewController = controller
        UIWindow.key?.makeKeyAndVisible()
    }
    
    let accountLabel: UILabel = {
        let lab = UILabel()
        lab.text = "帳號(E-Mail)"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 16)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let accountLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let accountTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "請輸入帳號"
        tf.text = "ktrade@gmail.com"
        tf.returnKeyType = .done
        tf.addTarget(self, action: #selector(closeKeyboard), for: .editingDidEndOnExit)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    @objc func closeKeyboard() {
        
    }
    
    let accountTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordLabel: UILabel = {
        let lab = UILabel()
        lab.text = "密碼"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 16)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let passwordLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "請輸入密碼"
        tf.text = "password"
        tf.isSecureTextEntry = true
        tf.returnKeyType = .done
        tf.addTarget(self, action: #selector(closeKeyboard), for: .editingDidEndOnExit)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //登入 View
    lazy var loginView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9606800675, green: 0.9608443379, blue: 0.9606696963, alpha: 1)
        setupShadow(view: view)
        return view
    }()
    
    //登入 Button
    let loginBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("登入", for: .normal)
        
        btn.setTitleColor(UIColor.black,for: .normal)
        btn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func loginAction() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = storyBoard.instantiateViewController(withIdentifier: "tabbarID") as! UITabBarController
        
        tabBarController.selectedIndex = 0
        UIWindow.key?.rootViewController = tabBarController
        UIWindow.key?.makeKeyAndVisible()
        
    }
    
    let registeredView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9568629861, green: 0.9529849887, blue: 0.9527811408, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //登入 UILabel
    let registeredTitleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "還沒有帳戶嗎？"
        lab.backgroundColor = .clear
        lab.font = UIFont.boldSystemFont(ofSize: 14)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    //註冊 Button
    let registeredBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("開始註冊", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(registeredAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func registeredAction() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        UIWindow.key?.rootViewController = UINavigationController(rootViewController: controller)
        UIWindow.key?.makeKeyAndVisible()
    }
    //
    let forgetPWBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("忘記密碼", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(forgetPassWordAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func forgetPassWordAction() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "ForgetPasswordVC") as! ForgetPasswordViewController
        
//        UIWindow.key?.rootViewController = UINavigationController(rootViewController: controller)
//        UIWindow.key?.makeKeyAndVisible()
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func setupLayout() {
        view.addSubview(accountLabel)
        view.addSubview(accountLabelView)
        view.addSubview(accountTextField)
        view.addSubview(accountTFView)
        view.addSubview(passwordLabel)
        view.addSubview(passwordLabelView)
        view.addSubview(passwordTextField)
        view.addSubview(passwordTFView)
        view.addSubview(loginView)
        loginView.addSubview(loginBtn)
        view.addSubview(registeredView)
        view.addSubview(registeredTitleLabel)
        view.addSubview(registeredBtn)
        view.addSubview(forgetPWBtn)
        
        accountLabel.setAnchor(top: view.safeTopAnchor, left: view.safeLeftAnchor, bottom: nil, right: view.safeRightAnchor, paddingTop: 50, paddingLeft: 30, paddingBottom: 0, paddingRight: 20)
        
        accountLabelView.setAnchor(top: accountLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        accountTextField.setAnchor(top: accountLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        accountTFView.setAnchor(top: accountTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        passwordLabel.setAnchor(top: accountTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 35, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        passwordLabelView.setAnchor(top: passwordLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        passwordTextField.setAnchor(top: passwordLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        passwordTFView.setAnchor(top: passwordTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        loginView.setAnchor(top: passwordTFView.bottomAnchor, left: accountLabel.safeLeftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: view.frame.height / 17)
        
        loginBtn.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        loginBtn.centerYAnchor.constraint(equalTo: loginView.centerYAnchor).isActive = true
        loginBtn.widthAnchor.constraint(equalTo: loginView.widthAnchor, multiplier: 1).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        registeredView.setAnchor(top: nil, left: view.safeLeftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: view.frame.height / 8)
        
        //
        registeredTitleLabel.centerXAnchor.constraint(equalTo: registeredView.centerXAnchor, constant: -35).isActive = true
        registeredTitleLabel.centerYAnchor.constraint(equalTo: registeredView.centerYAnchor, constant: 10).isActive = true
        registeredTitleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        registeredTitleLabel.heightAnchor.constraint(equalTo: registeredView.heightAnchor, multiplier: 1).isActive = true
        //
        registeredBtn.setAnchor(top: registeredTitleLabel.topAnchor, left: registeredTitleLabel.rightAnchor, bottom: registeredTitleLabel.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: -20, paddingBottom: 0, paddingRight: 0, width: 100, height: 0)
        
        forgetPWBtn.centerXAnchor.constraint(equalTo: registeredView.centerXAnchor, constant: 0).isActive = true
        forgetPWBtn.centerYAnchor.constraint(equalTo: registeredView.centerYAnchor, constant: -25).isActive = true
        forgetPWBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        forgetPWBtn.heightAnchor.constraint(equalTo: registeredView.heightAnchor, multiplier: 0.5).isActive = true
        
    }

    
    func setupShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 1.0
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

