//
//  PreventionSchoolViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/13.
//  Copyright © 2020 Swift. All rights reserved.
//  TabBar-3 防救災單位

import UIKit

class PreventionSchoolViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitView()
    }


    @IBAction func segmentValueChange(_ sender: UISegmentedControl) {

        let selectIndex = sender.selectedSegmentIndex
        
        switch selectIndex {
        case 0:
            view1.alpha = 1
            view2.alpha = 0
            view3.alpha = 0
        case 1:
            view1.alpha = 0
            view2.alpha = 1
            view3.alpha = 0
        case 2:
            view1.alpha = 0
            view2.alpha = 0
            view3.alpha = 1
        default:
            break
        }
    }
    
    func setupInitView() {
        view1.alpha = 1
        view2.alpha = 0
        view3.alpha = 0
    }
    

}
