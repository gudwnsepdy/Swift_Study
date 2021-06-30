//
//  Movie.swift
//  project_E
//
//  Created by 형주 on 2021/06/07.
//

import Foundation



struct Movie: Codable {
    
    var title: String
    var grade: Int
    var audience: Int
    
    
    var actor: String
    var duration: Int
    var director: String
    var synopsis: String
    var genre: String
    
    var image: String
    var reservation_grade: Int
    
    var reservation_rate: Double
    var user_rating: Double
    var date: String
    var id: String
    
}
