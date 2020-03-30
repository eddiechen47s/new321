//
//  ResetPasswordViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/26.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    let resetFinishViewController = ResetFinishViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavBarToTheViews()
        setupLayout()
        keyboardHides()
        self.navigationItem.title = "忘記密碼"
    }
    
      let titleLabel: UILabel = {
            let lab = UILabel()
            lab.text = "重設密碼"
            lab.textAlignment = .center
            lab.lineBreakMode = .byWordWrapping
            lab.numberOfLines = 0
            lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            lab.translatesAutoresizingMaskIntoConstraints = false
            return lab
        }()
        
        let accountLabel: UILabel = {
            let lab = UILabel()
            lab.text = "新密碼"
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
            tf.placeholder = "請輸入密碼"
            tf.text = "227384"
            tf.returnKeyType = .next
            tf.isSecureTextEntry = true
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
    
        //確認密碼
        let doubleCheckLabel: UILabel = {
            let lab = UILabel()
            lab.text = "確認密碼"
            lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            lab.font = UIFont.systemFont(ofSize: 16)
            lab.translatesAutoresizingMaskIntoConstraints = false
            return lab
        }()
    
        let doubleCheckLabelView: UIView = {
            let view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
        let doubleCheckTextField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "請輸入密碼"
            tf.text = "227384"
            tf.returnKeyType = .next
            tf.isSecureTextEntry = true
            tf.addTarget(self, action: #selector(closeKeyboard), for: .editingDidEndOnExit)
            tf.translatesAutoresizingMaskIntoConstraints = false
            return tf
        }()
        let doubleCheckTFView: UIView = {
            let view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

    
        //繼續 view
        let continueView: UIView = {
            let view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.9606800675, green: 0.9608443379, blue: 0.9606696963, alpha: 1)
            view.setupShadow(view: view)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        //繼續 Button
        lazy var continueButton: UIButton = {
            let btn = UIButton(type: .system)
            btn.setTitle("繼續", for: .normal)
            btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btn.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
        
        @objc func continueAction() {
            
            resetFinishViewController.showView()
        }
        
        func setupLayout() {
            view.addSubview(titleLabel)
            //
            view.addSubview(accountLabel)
            view.addSubview(accountLabelView)
            view.addSubview(accountTextField)
            view.addSubview(accountTFView)
            //
            view.addSubview(doubleCheckLabel)
            view.addSubview(doubleCheckLabelView)
            view.addSubview(doubleCheckTextField)
            view.addSubview(doubleCheckTFView)
            //
            view.addSubview(continueView)
            view.addSubview(continueButton)
            
            //
            titleLabel.setAnchor(top: view.safeTopAnchor, left: view.safeLeftAnchor, bottom: nil, right: view.safeRightAnchor, paddingTop: 40, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
            //
            accountLabel.setAnchor(top: titleLabel.bottomAnchor, left: view.safeLeftAnchor, bottom: nil, right: view.safeRightAnchor, paddingTop: 50, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
            
            accountLabelView.setAnchor(top: accountLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
            
            accountTextField.setAnchor(top: accountLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
            
            accountTFView.setAnchor(top: accountTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
            //
            doubleCheckLabel.setAnchor(top: accountTFView.bottomAnchor, left: view.safeLeftAnchor, bottom: nil, right: view.safeRightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
            
            doubleCheckLabelView.setAnchor(top: doubleCheckLabel.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
            
            doubleCheckTextField.setAnchor(top: doubleCheckLabelView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
            
            doubleCheckTFView.setAnchor(top: doubleCheckTextField.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
            //continue
            continueView.setAnchor(top: doubleCheckTFView.bottomAnchor, left: accountLabel.leftAnchor, bottom: nil, right: accountLabel.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
            continueButton.setAnchor(top: continueView.topAnchor, left: continueView.leftAnchor, bottom: continueView.bottomAnchor, right: continueView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        }
        
        
        
        
        

}