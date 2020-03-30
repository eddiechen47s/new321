//
//  WeatherModel.swift
//  FangZai
//
//  Created by ktrade on 2020/3/6.
//  Copyright © 2020 Swift. All rights reserved.
//

import Foundation

struct WeatherModels: Codable {
    var datas: Detail
}

struct Detail: Codable {
    let forecast: [NextWeather]
    let MaxT: String
    let MinT: String
    let PoP12h: String
    let UVI: String
    let Wx: String
}

struct NextWeather: Codable {
    let MaxT: String
    let MinT: String
    let Wx: String
}
