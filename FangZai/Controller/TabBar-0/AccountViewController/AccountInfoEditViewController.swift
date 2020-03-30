//
//  AccountInfoEditViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/30.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class AccountInfoEditViewController: UIViewController {
    
    @IBOutlet weak var views: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBarToTheViews()
        setNavRightBar()
        setupLayout()
        self.navigationItem.title = "帳戶資訊"
    }
    
    func setNavRightBar() {
        let rightBarItem = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(toEditViewAction))
        rightBarItem.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        navigationItem.rightBarButtonItem = rightBarItem
        //改變 titleColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)]
        //固定 NavigationBar 恆在
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    @objc func toEditViewAction() {
        let alert = UIAlertController(title: "", message: "確認要修改資料嗎？", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "確認", style: .default) { (result) in
            self.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (result) in
            //            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func setupLayout() {
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
        //schoolClass
        views.addSubview(schoolClassLabel)
        views.addSubview(schoolClassLabelView)
        views.addSubview(schoolClassTextField)
        views.addSubview(schoolClassTFView)
        //school
        views.addSubview(schoolLabel)
        views.addSubview(schoolLabelView)
        views.addSubview(schoolTextField)
        views.addSubview(schoolTFView)
        //contactPerson
        views.addSubview(contactPersonLabel)
        views.addSubview(contactPersonLabelView)
        views.addSubview(contactPersonTextField)
        views.addSubview(contactPersonTFView)
        //學校聯絡電話
        views.addSubview(contactNumLabel)
        views.addSubview(contactNumLabelView)
        views.addSubview(contactNumTextField)
        views.addSubview(contactNumTFView)
        //學校統編
        views.addSubview(schoolIDLabel)
        views.addSubview(schoolIDLabelView)
        views.addSubview(schoolIDTextField)
        views.addSubview(schoolIDTFView)
        
        //city
        cityLabel.setAnchor(top: views.topAnchor, left: views.leftAnchor, bottom: nil, right: views.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        cityLabelView.setAnchor(top: cityLabel.bottomAnchor, left: cityLabel.leftAnchor, bottom: nil, right: cityLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        cityTextField.setAnchor(top: cityLabelView.bottomAnchor, left: cityLabel.leftAnchor, bottom: nil, right: cityLabel.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        cityTFView.setAnchor(top: cityTextField.bottomAnchor, left: cityLabel.leftAnchor, bottom: nil, right: cityLabel.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //town
        townLabel.setAnchor(top: cityTFView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        townLabelView.setAnchor(top: townLabel.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        townTextField.setAnchor(top: townLabelView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        townTFView.setAnchor(top: townTextField.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //schoolClass
        schoolClassLabel.setAnchor(top: townTFView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        schoolClassLabelView.setAnchor(top: schoolClassLabel.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        schoolClassTextField.setAnchor(top: schoolClassLabelView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        schoolClassTFView.setAnchor(top: schoolClassTextField.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //school
        schoolLabel.setAnchor(top: schoolClassTFView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        schoolLabelView.setAnchor(top: schoolLabel.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        schoolTextField.setAnchor(top: schoolLabelView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        schoolTFView.setAnchor(top: schoolTextField.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //contactPerson
        contactPersonLabel.setAnchor(top: schoolTFView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        contactPersonLabelView.setAnchor(top: contactPersonLabel.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        contactPersonTextField.setAnchor(top: contactPersonLabelView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        contactPersonTFView.setAnchor(top: contactPersonTextField.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //學校聯絡電話
        contactNumLabel.setAnchor(top: contactPersonTFView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        contactNumLabelView.setAnchor(top: contactNumLabel.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        contactNumTextField.setAnchor(top: contactNumLabelView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        contactNumTFView.setAnchor(top: contactNumTextField.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        //學校統編
        schoolIDLabel.setAnchor(top: contactNumTFView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        schoolIDLabelView.setAnchor(top: schoolIDLabel.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        schoolIDTextField.setAnchor(top: schoolIDLabelView.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        schoolIDTFView.setAnchor(top: schoolIDTextField.bottomAnchor, left: cityTFView.leftAnchor, bottom: nil, right: cityTFView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    }
    
    //縣市
    let cityLabel: UILabel = {
        let lab = UILabel()
        lab.text = "   縣市"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 14)
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
        lab.text = "   鄉鎮縣市"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 14)
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
    //學校類別
    let schoolClassLabel: UILabel = {
        let lab = UILabel()
        lab.text = "   學校類別"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let schoolClassLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let schoolClassTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "國小"
        tf.returnKeyType = .next
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let schoolClassTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //學校
    let schoolLabel: UILabel = {
        let lab = UILabel()
        lab.text = "   國小"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let schoolLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let schoolTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "縣立玉田國小"
        tf.returnKeyType = .next
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let schoolTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //學校聯絡人
    let contactPersonLabel: UILabel = {
        let lab = UILabel()
        lab.text = "  學校聯絡人"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let contactPersonLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let contactPersonTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "王大侖"
        tf.returnKeyType = .next
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let contactPersonTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //學校聯絡電話
    let contactNumLabel: UILabel = {
        let lab = UILabel()
        lab.text = "  學校聯絡電話"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let contactNumLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let contactNumTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "02-2222-8888"
        tf.returnKeyType = .next
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let contactNumTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //學校統編
    let schoolIDLabel: UILabel = {
        let lab = UILabel()
        lab.text = "  學校統編"
        lab.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let schoolIDLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let schoolIDTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.text = "46011234"
        tf.returnKeyType = .next
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let schoolIDTFView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
