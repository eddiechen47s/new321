//
//  LoadingViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/26.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoadingViewController: UIViewController {
    
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

            blackView.backgroundColor = UIColor(white: 0, alpha: 0.85)
            blackView.frame = window.bounds
//            blackView.alpha = 0

            let loading = NVActivityIndicatorView(frame: .zero, type: .pacman, color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), padding: 0)
            let loading1 = NVActivityIndicatorView(frame: .zero, type: .pacman, color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), padding: 0)
            let loading2 = NVActivityIndicatorView(frame: .zero, type: .pacman, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), padding: 0)
                    
                  loading.translatesAutoresizingMaskIntoConstraints = false
                  loading1.translatesAutoresizingMaskIntoConstraints = false
                  loading2.translatesAutoresizingMaskIntoConstraints = false
            
                  blackView.addSubview(loadView)
                  loadView.addSubview(loadLabel)
                  loadView.addSubview(loading)
                  loadView.addSubview(loading1)
                  loadView.addSubview(loading2)
            
                  NSLayoutConstraint.activate([
                      loadView.widthAnchor.constraint(equalTo: blackView.widthAnchor, multiplier: 0.8),
                      loadView.heightAnchor.constraint(equalTo: blackView.heightAnchor, multiplier: 0.15),
                      loadView.centerYAnchor.constraint(equalTo: blackView.centerYAnchor, constant: -50),
                      loadView.centerXAnchor.constraint(equalTo: blackView.centerXAnchor),
                      
                      loadLabel.topAnchor.constraint(equalTo: loadView.topAnchor, constant: 20),
                      loadLabel.centerXAnchor.constraint(equalTo: loadView.centerXAnchor),
                      loadLabel.widthAnchor.constraint(equalTo: loadView.widthAnchor, multiplier: 1),
                      loadLabel.heightAnchor.constraint(equalToConstant: 50),

                      loading.centerXAnchor.constraint(equalTo: loadView.centerXAnchor,constant:  0),
                      loading.bottomAnchor.constraint(equalTo: loadView.bottomAnchor),
                      loading.widthAnchor.constraint(equalToConstant: 50),
                      loading.heightAnchor.constraint(equalToConstant: 50),
                      
                      loading1.leadingAnchor.constraint(equalTo: loading.trailingAnchor, constant: 20),
                      loading1.bottomAnchor.constraint(equalTo: loadView.bottomAnchor),
                      loading1.widthAnchor.constraint(equalToConstant: 50),
                      loading1.heightAnchor.constraint(equalToConstant: 50),
//
                      loading2.trailingAnchor.constraint(equalTo: loading.leadingAnchor, constant: -20),
                      loading2.bottomAnchor.constraint(equalTo: loadView.bottomAnchor),
                      loading2.widthAnchor.constraint(equalToConstant: 50),
                      loading2.heightAnchor.constraint(equalToConstant: 50),
                      ])
                  
                  loading.startAnimating()
                  loading1.startAnimating()
                  loading2.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.8) {
                      self.loadView.alpha = 0
                    self.blackView.alpha = 0
//                    self.checkView.alpha = 0
                  }
        }
        
//        UIView.animate(withDuration: 1.5) {
//                      self.blackView.alpha = 0
//                      self.checkView.alpha = 0
//                  }
    }

    let loadView: UIView = {
         let view = UIView()
          view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
    
    let loadLabel: UILabel = {
       let lab = UILabel()
        lab.text = "請稍候"
        lab.font = UIFont.boldSystemFont(ofSize: 18)
        lab.textAlignment = .center
        lab.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    let loadViews: NVActivityIndicatorView = {
        let view = NVActivityIndicatorView(frame: .zero, type: .pacman, color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), padding: 0)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
