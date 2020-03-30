//
//  XibExtension.swift
//  FangZai
//
//  Created by ktrade on 2020/3/5.
//  Copyright © 2020 Swift. All rights reserved.
//

import Foundation
import UIKit

protocol XibCell {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension XibCell {
    static var identifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}




extension UITableView {
  func reloadDataSmoothly() {
    UIView.setAnimationsEnabled(false)
    CATransaction.begin()

    CATransaction.setCompletionBlock { () -> Void in
      UIView.setAnimationsEnabled(true)
    }

    reloadData()
    beginUpdates()
    endUpdates()

    CATransaction.commit()
  }
}
