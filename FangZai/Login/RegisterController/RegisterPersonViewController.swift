//
//  RegisterPersonViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/24.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class RegisterPersonViewController: UIViewController {
    
    @IBOutlet weak var views: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var textFields: [UITextField] = []
    let registerFinishedViewController = RegisterFinishedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarToTheViews()
        setupLayout()
        
        keyboardHide()
        registerForKeyboardNotifications()
        registerKeyboardNotifications()
        setupTextField()
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func keyboardHide() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        scrollView.addGestureRecognizer(tap) // to Replace "TouchesBegan"
    }
    
    @objc func dismissKeyBoard() {
        self.view.endEditing(true)
    }
    
    func setupTextField() {
        accountTextField.delegate = self
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
        donateTextField.delegate = self
        idTextField.delegate = self
        phoneNumTextField.delegate = self
        postalCodeTextField.delegate = self
        cityTextField.delegate = self
        townTextField.delegate = self
        addressTextField.delegate = self
        
        self.textFields.append(accountTextField)
        self.textFields.append(passwordTextField)
        self.textFields.append(checkPasswordTextField)
        self.textFields.append(donateTextField)
        self.textFields.append(idTextField)
        self.textFields.append(phoneNumTextField)
        self.textFields.append(postalCodeTextField)
        self.textFields.append(cityTextField)
        self.textFields.append(townTextField)
        self.textFields.append(addressTextField)
    }
    
    func setupLayout() {
        views.addSubview(accountLabel)
        views.addSubview(accountLabelView)
        views.addSubview(accountTextField)
        views.addSubview(accountTFView)
        //
        views.addSubview(passwordLabel)
        views.addSubview(passwordLabelView)
        views.addSubview(passwordTextField)
        views.addSubview(passwordTFView)
        //
        views.addSubview(checkPasswordLabel)
        views.addSubview(checkPasswordLabelView)
        views.addSubview(checkPasswordTextField)
        views.addSubview(checkPasswordTFView)
        //
        views.addSubview(titleAccountLabel)
        //
        views.addSubview(donateLabel)
        views.addSubview(donateLabelView)
        views.addSubview(donateTextField)
        views.addSubview(donateTFView)
        //
        views.addSubview(idLabel)
        views.addSubview(idLabelView)
        views.addSubview(idTextField)
        views.addSubview(idTFView)
        //
        views.addSubview(phoneNumLabel)
        views.addSubview(phoneNumLabelView)
        views.addSubview(phoneNumTextField)
        views.addSubview(phoneNumTFView)
        //
        views.addSubview(postalCodeLabel)
        views.addSubview(postalCodeLabelView)
        views.addSubview(postalCodeTextField)
        views.addSubview(postalCodeTFView)
        //city
        views.addSubview(cityLabel)
        views.addSubview(cityLabelView)
        views.addSubview(cityTextField)
        views.addSubview(cityTFView)
        //town
        views.addSubview(townLabel)
        views.addSubview(townLabelView)
        views.addSubview(townTextField)
        views.addSubview(townTFView)
        //address
        views.addSubview(addressLabel)
        views.addSubview(addressLabelView)
        views.addSubview(addressTextField)
        views.addSubview(addressTFView)
        //register
        views.addSubview(registerlView)
        views.addSubview(registerButton)
        
        //
        accountLabel.setAnchor(top: views.safeTopAnchor, left: views.leftAnchor, bottom: nil, right: views.safeRightAnchor, paddingTop: 50, paddingLeft: 30, paddingBottom: 0, paddingRight: 20)
        
        accountLabelView.setAnchor(top: accountLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        accountTextField.setAnchor(top: accountLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        accountTFView.setAnchor(top: accountTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        //
        passwordLabel.setAnchor(top: accountTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 35, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        passwordLabelView.setAnchor(top: passwordLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        passwordTextField.setAnchor(top: passwordLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        passwordTFView.setAnchor(top: passwordTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //
        checkPasswordLabel.setAnchor(top: passwordTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 35, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        checkPasswordLabelView.setAnchor(top: checkPasswordLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        checkPasswordTextField.setAnchor(top: checkPasswordLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        checkPasswordTFView.setAnchor(top: checkPasswordTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        //
        titleAccountLabel.topAnchor.constraint(equalTo: checkPasswordTFView.bottomAnchor, constant: 15).isActive = true
        titleAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleAccountLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        titleAccountLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        //
        donateLabel.setAnchor(top: titleAccountLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        donateLabelView.setAnchor(top: donateLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        donateTextField.setAnchor(top: donateLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        donateTFView.setAnchor(top: donateTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //
        idLabel.setAnchor(top: donateTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        idLabelView.setAnchor(top: idLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        idTextField.setAnchor(top: idLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        idTFView.setAnchor(top: idTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //
        phoneNumLabel.setAnchor(top: idTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        phoneNumLabelView.setAnchor(top: phoneNumLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        phoneNumTextField.setAnchor(top: phoneNumLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        phoneNumTFView.setAnchor(top: phoneNumTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //
        postalCodeLabel.setAnchor(top: phoneNumTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        postalCodeLabelView.setAnchor(top: postalCodeLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        postalCodeTextField.setAnchor(top: postalCodeLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        postalCodeTFView.setAnchor(top: postalCodeTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //city
        cityLabel.setAnchor(top: postalCodeTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        cityLabelView.setAnchor(top: cityLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        cityTextField.setAnchor(top: cityLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        cityTFView.setAnchor(top: cityTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //town
        townLabel.setAnchor(top: cityTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        townLabelView.setAnchor(top: townLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        townTextField.setAnchor(top: townLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        townTFView.setAnchor(top: townTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //address
        addressLabel.setAnchor(top: townTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        addressLabelView.setAnchor(top: addressLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        addressTextField.setAnchor(top: addressLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addressTFView.setAnchor(top: addressTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //register
        registerlView.setAnchor(top: addressTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        registerButton.setAnchor(top: registerlView.topAnchor, left: registerlView.leftAnchor, bottom: registerlView.bottomAnchor, right: registerlView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
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
        tf.returnKeyType = .next
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
        tf.returnKeyType = .next
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
    
    
    let checkPasswordLabel: UILabel = {
        let lab = UILabel()
        lab.text = "確認密碼"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 16)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let checkPasswordLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let checkPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "請輸入密碼"
        tf.text = "password"
        tf.isSecureTextEntry = true
        tf.returnKeyType = .next
        //        tf.addTarget(self, action: #selector(closeKeyboard), for: .editingDidEndOnExit)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let checkPasswordTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleAccountLabel: UILabel = {
        let lab = UILabel()
        lab.text = "帳戶資訊"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 16)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    //捐贈
    let donateLabel: UILabel = {
        let lab = UILabel()
        lab.text = "捐贈人/廠商"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        //        lab.textAlignment = .center
        //畫底線
        //        lab.attributedText = NSAttributedString(string: "Text", attributes:
        //        [.underlineStyle: NSUnderlineStyle.single.rawValue])
        lab.font = UIFont.systemFont(ofSize: 10)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let donateLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let donateTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "王大倫"
        tf.returnKeyType = .next
        //        tf.addTarget(self, action: #selector(closeKeyboard), for: .editingDidEndOnExit)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let donateTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //身分證字號 / 統一編號
    let idLabel: UILabel = {
        let lab = UILabel()
        lab.text = "身分證字號/統一編號"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 10)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let idLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let idTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "A123456789"
        tf.returnKeyType = .next
        //            tf.addTarget(self, action: #selector(closeKeyboard), for: .editingDidEndOnExit)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let idTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //聯絡電話
    let phoneNumLabel: UILabel = {
        let lab = UILabel()
        lab.text = "聯絡電話"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 10)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let phoneNumLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let phoneNumTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "0988-000-123"
        //            tf.addTarget(self, action: #selector(closeKeyboard), for: .editingDidEndOnExit)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let phoneNumTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //郵遞區號
    let postalCodeLabel: UILabel = {
        let lab = UILabel()
        lab.text = "郵遞區號"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 10)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let postalCodeLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let postalCodeTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "10461"
        tf.returnKeyType = .next
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let postalCodeTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //城市
    let cityLabel: UILabel = {
        let lab = UILabel()
        lab.text = "城市"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 10)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let cityLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let cityTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "台北市"
        tf.returnKeyType = .next
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let cityTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //鄉鎮縣市
    let townLabel: UILabel = {
        let lab = UILabel()
        lab.text = "鄉鎮縣市"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 10)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let townLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let townTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "中山區"
        tf.returnKeyType = .next
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let townTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //地址
    let addressLabel: UILabel = {
        let lab = UILabel()
        lab.text = "地址"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 10)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let addressLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let addressTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "德惠街7-1號8樓822室"
        tf.returnKeyType = .done
        tf.addTarget(self, action: #selector(closeKeyboard), for: .editingDidEndOnExit)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let addressTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //register view
    let registerlView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9606800675, green: 0.9608443379, blue: 0.9606696963, alpha: 1)
        view.setupShadow(view: view)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //開始註冊 Button
    let registerButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("確認註冊", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func registerAction() {
        registerFinishedViewController.showView()
    }
}

extension RegisterPersonViewController {
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] (aNoti) in
            guard let self = self else { return }
            self.keyboardWasShown(aNoti)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { [weak self] (aNoti) in
            guard let self = self else { return }
            self.keyboardWillBeHidden(aNoti)
        }
    }
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func keyboardWasShown(_ aNotification: Notification?) {
        let info = aNotification?.userInfo
        guard let kbSize = (info?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size else { return }
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        scrollView.contentInset = contentInsets
    }
    
    private func keyboardWillBeHidden(_ aNotification: Notification?) {
        let contentInsets: UIEdgeInsets = .zero
        scrollView.contentInset = contentInsets
    }
    
}

extension RegisterPersonViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let index = textFields.firstIndex(of: textField) else { return true }
        let nextIndex = index + 1
        if textFields.indices.contains(nextIndex) {
            textFields[nextIndex].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
