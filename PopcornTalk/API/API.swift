//
//  Api.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 9/16/25.
//

import Foundation
import Combine

struct API {
    let movieApiUrl = URL(string:"https://68c9b314ceef5a150f65d22b.mockapi.io/Movie")!
    let reviewApiUrl = URL(string:"https://68c9b314ceef5a150f65d22b.mockapi.io/Review")!
    
    func loadMovies() -> AnyPublisher<[Movie], Error> {
         URLSession.shared.dataTaskPublisher(for: movieApiUrl)
            .map { $0.data }
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    /*
     func loadMovie(id: String) -> AnyPublisher<Movie, Error> {
        guard let url = URL(string: "\(movieApiUrl.absoluteString)/\(id)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Movie.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    */
    
    func loadReviews() -> AnyPublisher<[Review], Error> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970 // timestamp -> date type
        
        return URLSession.shared.dataTaskPublisher(for: reviewApiUrl)
            .map { $0.data }
            .decode(type: [Review].self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
