//
//  Movie.swift
//  project_E
//
//  Created by 형주 on 2021/06/07.
//

import Foundation


struct APIResponse: Codable {
    let movies: [Movies]
}

struct Movies: Codable {
    
    let title: String
    let grade: Int
    let thumb: String
    let reservation_grade: Int
    
    let reservation_rate: Double
    let user_rating: Double
    let date: String
    let id: String
    
}



struct CommentsAPIResponse: Codable {
    let comments: [Comment]
}

struct Comment: Codable{
    let id: String
    let rating: Double
    let timestamp: Double
    let writer: String
    let movie_id: String
    let contents: String
    
}
