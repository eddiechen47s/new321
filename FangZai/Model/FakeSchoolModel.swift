//
//  FakeSchoolModel.swift
//  FangZai
//
//  Created by ktrade on 2020/3/17.
//  Copyright © 2020 Swift. All rights reserved.
//

import Foundation

struct UserData: Codable {
    var customer_id: Int
    var customer_name: String
    var customer_type: String
    var age: Int
    var units_sold: Int
}
