//
//  Weather.swift
//  Weather
//
//  Created by 형주 on 2021/06/01.
//

import Foundation

struct Weather: Codable {
    let city_name: String
    let state: Int
    let celsius: Float
    let rainfall_probability: Int
    
}
