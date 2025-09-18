//
//  ReviewsTableCell.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 3/22/25.
//

import SwiftUI

class ReviewsTableCell: UITableViewCell {
    // Movie Poster
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // containterView for title/date/rating
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    // Movie Title
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Date
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Rating - show as start
    let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Set background to clear to avoid full-width appearance
        backgroundColor = .clear
        
        // Customize the content view
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = CGColor(gray: 0.8, alpha: 0.5) // gray: 1.0(white), 0.0(black) / alpha: 1.0(opaque), 0.0(transparent)
        contentView.layer.masksToBounds = true

        // Add subviews
        contentView.addSubview(posterImageView)
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(starStackView)

        // Set constraints
        NSLayoutConstraint.activate([
            // Poster Image
            posterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            posterImageView.widthAnchor.constraint(equalToConstant: 70),
            posterImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Container View
            containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.heightAnchor.constraint(equalToConstant: 70),
            
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // Date Label
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // Rating
            starStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            starStackView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            starStackView.heightAnchor.constraint(equalToConstant: 20),
            starStackView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Function to Configure Cell Data
    func configure(poster: String, title: String, date: String, rating: Double) {
        posterImageView.image = UIImage(named: poster) ?? UIImage(named: "placeholder")
        titleLabel.text = title
        dateLabel.text = date
        updateStarRating(rating: rating)
    }
    
    // date -> string
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter.string(from: date)
    }
    
    // Update Star Rating
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
    
    // some space between cells
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
    }
}
