//
//  RescueAssetsViewController.swift
//  FangZai
//
//  Created by ktrade on 2020/3/11.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

class RescueAssetsViewController: UIViewController {

    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.alpha = 1
        view2.alpha = 0
        
    }
    

    @IBAction func segmentValueChange(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            view1.alpha = 1
            view2.alpha = 0
        } else {
            view1.alpha = 0
            view2.alpha = 1
        }
        
    }
    

}
