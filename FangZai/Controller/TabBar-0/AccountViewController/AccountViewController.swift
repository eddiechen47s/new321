//
//  AccountViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/27.
//  Copyright © 2020 Swift. All rights reserved.
//  Setting

import UIKit

class AccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let accountAr = ["帳戶資訊","密碼"]
    let notice = ["通知","最新資訊"]
    let another = ["意見回饋","版本"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBarToTheViews()
        setupHeaderView()
        
    }
    
    func setupHeaderView() {
        //icPerson
        self.navigationItem.title = "我的帳號"
        
        let headerView = AccountHeaderView(frame: .zero)
        guard let img = UIImage(named: "icPerson")?.withRenderingMode(.alwaysTemplate) else { return }
        
        headerView.configure(text: "Ktrade@gmail.com", image: img)
        tableView.tableHeaderView = headerView
        tableView.tableHeaderView?.backgroundColor = .white
        
        tableView.showsVerticalScrollIndicator = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        case 2:
            return 2
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.section
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        switch index {
        case 0:
            cell.textLabel?.text = accountAr[indexPath.row]
        case 1:
            cell.textLabel?.text = "受贈紀錄與證書"
        case 2:
            cell.textLabel?.text = notice[indexPath.row]
        default:
            cell.textLabel?.text = another[indexPath.row]
        }

        cell.accessoryType = .disclosureIndicator
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = UILabel()
        title.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        switch section {
        case 0:
            title.text = "    帳號"
        case 1:
            title.text = "    紀錄"
        case 2:
            title.text = "    通知"
        default:
            title.text = "    其他"
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = indexPath.section
        let indexRow = indexPath.row
        
        switch section {
        case 0:
            if indexRow == 0 {
                print("section:\(section),row:\(indexRow)")
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyBoard.instantiateViewController(withIdentifier: "AccountInfoVC") as! AccountInfoViewController
                
                self.navigationController?.pushViewController(controller, animated: true)
            } else {
                print("section:\(section),row:\(indexRow)")
            }
        case 1:
            print("section:\(section),row:\(indexRow)")
        case 2:
            print("section:\(section),row:\(indexRow)")
        default:
            print("section:\(section),row:\(indexRow)")
        }
      
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateHeaderViewHeight(for: tableView.tableHeaderView)
        
    }
    
    func updateHeaderViewHeight(for header: UIView?) {
        guard let header = header else { return }
        header.frame.size.height = header.systemLayoutSizeFitting(CGSize(width: view.bounds.width - 32.0, height: 0)).height
    }
    
}

//class Component: UIView {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        addSubview(label)
//        addSubview(titleImage)
//        setupLayout()
//    }
//    
//    let label: UILabel = {
//        let lab = UILabel()
//        lab.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        lab.font = UIFont.boldSystemFont(ofSize: 30)
//        lab.numberOfLines = 0
//        lab.translatesAutoresizingMaskIntoConstraints = false
//        lab.textAlignment = .center
//        return lab
//    }()
//    
//    var titleImage: UIImageView = {
//        let img = UIImageView()
//        
//        img.image = UIImage(named: "icPerson")?.withRenderingMode(.alwaysOriginal)
//        img.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
//        img.translatesAutoresizingMaskIntoConstraints = false
//        return img
//    }()
//    
//    func setupLayout() {
//        
//        NSLayoutConstraint.activate([
//            label.centerYAnchor.constraint(equalTo: centerYAnchor),
//            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100.0),
//            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
//            
//            titleImage.centerYAnchor.constraint(equalTo: centerYAnchor),
//            titleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30.0),
//            titleImage.trailingAnchor.constraint(equalTo: label.leadingAnchor,constant: 0),
//            titleImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
//        ])
//    }
//    
//    func configure(text: String, image: UIImage) {
//        label.text = text
//        titleImage.image = image
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
