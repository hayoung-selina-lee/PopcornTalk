//
//  Review.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 2/8/25.
//

import Foundation

struct Review: Codable{
    let reviewId: String
    let userId: String
    let movieId: String
    let content: String
    let contentAt: Date
    let with: String
    
    // Mapping server key name and property name
    private enum CodingKeys: String, CodingKey {
        case reviewId = "id"
        case userId = "user_id"
        case movieId = "movie_id"
        case content
        case contentAt = "content_at"
        case with
    }
}
