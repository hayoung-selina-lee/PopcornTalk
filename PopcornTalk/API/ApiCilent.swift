//
//  ApiCilent.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 9/16/25.
//

import Foundation
import SwiftUI
import Combine

class ApiCilent : ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published var reviews: [Review] = []
    @Published var movies: [Movie] = []
    
    private let api = API()
    
    func loadMovies() {
        api.loadMovies()
            .sink(receiveCompletion: { result in
                if case .failure(let err) = result {
                    print("API call failed: \(err)")
                }
            }, receiveValue: { [weak self] movies in
                self?.movies = movies
                print("Movies loaded: \(movies.count)")
            })
            .store(in: &cancellables)
    }

    func loadReviews() {
        api.loadReviews()
            .sink(receiveCompletion: { result in
                if case .failure(let err) = result {
                    print("API call failed: \(err)")
                }
            }, receiveValue: { [weak self] reviews in
                self?.reviews = reviews
                print("Reviews loaded: \(reviews.count)")
            })
            .store(in: &cancellables)
    }
}
