//
//  CitysViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/18.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

protocol CityViewDelegate {
    func selectCityStr(str: String, index: Int)
}

class CitysViewController: UIViewController {
    
    let blackView = UIView()
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    
    var selectText: String?
    var tableView = UITableView()
    var delegate: CityViewDelegate?
    
    let cityAr = ["基隆市","台北市","新北市","桃園市","新竹市","新竹縣","苗栗縣","台中市","彰化縣","南投縣",]
    
    lazy var cityTitleView: CityMenuView = {
        let mb = CityMenuView()
        mb.backgroundColor = .white
        mb.citysViewController = self
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    func showCity() {

        if let window = UIWindow.key {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            window.addSubview(blackView)
            window.addSubview(cityTitleView)
            window.addSubview(tableView)

            cityTitleView.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
            cityTitleView.centerYAnchor.constraint(equalTo: window.centerYAnchor, constant: -160).isActive = true
            cityTitleView.widthAnchor.constraint(equalTo: window.widthAnchor, multiplier: 0.8).isActive = true
            cityTitleView.heightAnchor.constraint(equalTo: window.heightAnchor, multiplier: 0.09).isActive = true
            
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = 50
            tableView.showsVerticalScrollIndicator = false
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(CityTableCell.self, forCellReuseIdentifier: cellId)
            
            tableView.topAnchor.constraint(equalTo: cityTitleView.bottomAnchor).isActive = true
            tableView.leadingAnchor.constraint(equalTo: cityTitleView.leadingAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: cityTitleView.trailingAnchor).isActive = true
            tableView.heightAnchor.constraint(equalTo: cityTitleView.heightAnchor, multiplier: 4.5).isActive = true
            
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            UIView.animate(withDuration: 0.2) {
                self.blackView.alpha = 1
                self.cityTitleView.alpha = 1
                self.tableView.alpha = 1
            }
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.2) {
            self.blackView.alpha = 0
            self.cityTitleView.alpha = 0
            self.tableView.alpha = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCity()
        setupTableView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    func setupTableView() {
        
    }

}

extension CitysViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityAr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CityTableCell
        cell.titleLabel.text = cityAr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectText = cityAr[indexPath.row]
        
        self.delegate?.selectCityStr(str: self.selectText!, index: indexPath.row)
        
        self.dismiss(animated: true) {
            UIView.animate(withDuration: 0.3) {
                self.blackView.alpha = 0
                self.cityTitleView.alpha = 0
                self.tableView.alpha = 0
            }
        }
    }
}





