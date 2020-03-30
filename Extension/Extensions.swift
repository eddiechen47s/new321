//
//  Extensions.swift
//  Sections
//
//  Created by Pavel Bogart on 2/10/17.
//  Copyright © 2017 Pavel Bogart. All rights reserved.
//

import UIKit

extension UIView {
    
    func setCellShadow() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 15
    }
    
    func setAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
                paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat,
                paddingRight: CGFloat, width: CGFloat = 0, height: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }
    
}


extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
}


extension UIViewController {
    // 設置 NavigationBar
    func setNavBarToTheViews() {
        let leftBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icArrowBack"), style: .plain, target: self, action: #selector(clickBack))
        leftBarItem.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        navigationItem.leftBarButtonItem = leftBarItem
        view.backgroundColor = .white
        self.navigationItem.title = "註冊"
        //改變 titleColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)]
        //固定 NavigationBar 恆在
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func clickBack() {
        self.navigationController?.popViewController(animated: true)
    }
    

    
 
}

extension UIView {
    // 陰影
     func setupShadow(view: UIView) {
          view.layer.shadowColor = UIColor.black.cgColor
          view.layer.shadowOffset = CGSize(width: 0, height: 1)
          view.layer.shadowOpacity = 0.3
          view.layer.shadowRadius = 1.0
          view.clipsToBounds = false
          view.layer.masksToBounds = false
      }
}


extension UIView {
    func addBorder(toEdges edges: UIRectEdge, color: UIColor, thickness: CGFloat) {

        func addBorder(toEdge edges: UIRectEdge, color: UIColor, thickness: CGFloat) {
            let border = CALayer()
            border.backgroundColor = color.cgColor

            switch edges {
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
            case .bottom:
                border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            case .left:
                border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
            case .right:
                border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            default:
                break
            }

            layer.addSublayer(border)
        }

        if edges.contains(.top) || edges.contains(.all) {
            addBorder(toEdge: .top, color: color, thickness: thickness)
        }

        if edges.contains(.bottom) || edges.contains(.all) {
            addBorder(toEdge: .bottom, color: color, thickness: thickness)
        }

        if edges.contains(.left) || edges.contains(.all) {
            addBorder(toEdge: .left, color: color, thickness: thickness)
        }

        if edges.contains(.right) || edges.contains(.all) {
            addBorder(toEdge: .right, color: color, thickness: thickness)
        }
    }
}

extension UIViewController {
    func keyboardHides() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoards))
        view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
    }
    
    @objc func dismissKeyBoards() {
        self.view.endEditing(true)
    }
}
