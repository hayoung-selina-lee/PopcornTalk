//
//  ReviewsController.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 2/8/25.
//

import UIKit

class ReviewsController: UITableViewController {

    let reviews = [
        Movie(id:"1",title: "IronMan 1",rating: 1.5, date: Date(), poster: "image.png"),
        Movie(id:"2",title: "IronMan 2",rating: 2, date: Date(), poster: "image.png"),
        Movie(id:"3",title: "IronMan 3",rating: 3, date: Date(), poster: "image.png")
        
    ]
    
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
        cell.configure(poster: review.poster, title: review.title, date: review.date, rating: review.rating)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ReviewsTableCell.self, forCellReuseIdentifier: "ReviewedMovieCell") // register my custom cell
        tableView.separatorStyle = .none // remove the line between cells
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReviewDatailSegue" {
            if let destination = segue.destination as? ReviewDetailController {
                destination.movie = reviews[tableView.indexPathForSelectedRow!.row]
            }
        }
    }

}

