//
//  EarthquakeModel .swift
//  FangZai
//
//  Created by ktrade on 2020/3/10.
//  Copyright © 2020 Swift. All rights reserved.
//

import Foundation

struct EarthquakeModels: Codable {
//    let status: String
//    let errorCode: String
    var datas: [RecentData]
}

struct RecentData: Codable {
    let earthquakeNo: String
    let reportColor: String
    let longitude: Double
    let latitude: Double
    let location: String
    let value: Double
}
