//
//  ReviewDetailController.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 2/8/25.
//

import SwiftUI

class ReviewDetailController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var starStackView: UIStackView!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = movie.title
        numberLabel.text = movie.releaseDate
        imageView.image = UIImage(named: movie.posterPath) ?? UIImage(named: "placeholder")
        updateStarRating(rating: movie.voteAverage)
    }

    private func updateStarRating(rating: Double) {
        starStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let fullStars = Int(rating)
        let hasHalfStar = (rating - Double(fullStars)) >= 0.5
        
        for i in 1...5 {
            let starImageView = UIImageView()
            
            if i <= fullStars {
                starImageView.image = UIImage(systemName: "star.fill")
            } else if hasHalfStar && i == fullStars + 1 {
                starImageView.image = UIImage(systemName: "star.leadinghalf.filled")
            } else {
                starImageView.image = UIImage(systemName: "star")
            }
            
            starImageView.tintColor = .systemYellow
            starImageView.contentMode = .scaleAspectFit
            
            starStackView.addArrangedSubview(starImageView)
        }
    }
}
