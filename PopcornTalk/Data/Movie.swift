//
//  Movie.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 2/8/25.
//

import Foundation
    
struct Movie: Codable{
    let movieId: String
    let title: String
    let voteAverage: Double
    let releaseDate: String
    let posterPath: String

    // Mapping server key name and property name
    private enum CodingKeys: String, CodingKey {
        case movieId = "movie_id"
        case title
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}
