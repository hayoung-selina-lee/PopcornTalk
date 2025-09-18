//
//  ReviewsController.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 2/8/25.
//

import SwiftUI
import Combine
class ReviewsController: UITableViewController {

    private let apiClient = ApiCilent()
    private var cancellables = Set<AnyCancellable>()

    private var reviews: [Review] = []
    private var movies: [String: Movie] = [:]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Set row height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150 // Adjust cell height
    }
    
    // how many row elements
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    // connect data to view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewedMovieCell", for: indexPath) as! ReviewsTableCell
        let review = reviews[indexPath.row]
        
        if let movie = self.movies[review.movieId] {
            cell.configure(
                poster: movie.posterPath,
                title: movie.title,
                date: movie.releaseDate,
                rating: movie.voteAverage
            )
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ReviewsTableCell.self, forCellReuseIdentifier: "ReviewedMovieCell") // register my custom cell
        tableView.separatorStyle = .none // remove the line between cells
        
        apiClient.$reviews
            .receive(on: RunLoop.main)
            .sink { [weak self] reviews in
                self?.reviews = reviews
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)

        apiClient.$movies
            .receive(on: RunLoop.main)
            .sink { [weak self] movies in
                self?.movies = Dictionary(uniqueKeysWithValues: movies.map { ($0.movieId, $0) })
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
        
        loadAllData()
    }
    
    private func loadAllData() {
        apiClient.loadReviews()
        apiClient.loadMovies()
    }

    // selected event
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ReviewDatailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReviewDatailSegue" {
            if let destination = segue.destination as? ReviewDetailController,
               let indexPath = tableView.indexPathForSelectedRow {
                
                let review = reviews[indexPath.row]
                
                destination.movie = self.movies[review.movieId]
            }
        }
    }
}


