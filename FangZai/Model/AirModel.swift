//
//  AirModel.swift
//  FangZai
//
//  Created by ktrade on 2020/3/9.
//  Copyright © 2020 Swift. All rights reserved.
//

import Foundation


struct AirModels: Codable {
    let datas: AirDetail
}


struct AirDetail: Codable {
    let aqi: Int
}
