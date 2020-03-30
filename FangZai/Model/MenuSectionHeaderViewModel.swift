//
//  MenuSectionHeaderViewModel.swift
//  FangZai
//
//  Created by ktrade on 2020/3/27.
//  Copyright © 2020 Swift. All rights reserved.
//

import Foundation

struct MenuSectionHeaderViewModel {
    let title: String                   // Section title
    var menuItems: [MenuItemViewModel]  // Menu Items
}


struct MenuItemViewModel {
    let text: String
    var value: String?
    // Item text to display
      // Name of icon image if needed
    
    init(text: String, value: String? = nil) {
        self.text = text
        self.value = value
    }
    
}
