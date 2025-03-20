//
//  ReviewsController.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 2/8/25.
//

import UIKit

class ReviewsController: UITableViewController {

    let reviews = [
        Movie(id:"1",title: "IronMan 1",rating: 5, date: Date.now),
        Movie(id:"2",title: "IronMan 2",rating: 6, date: Date.now),
        Movie(id:"3",title: "IronMan 3",rating: 7, date: Date.now)
        
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // how many row elements
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    // connect data to view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewedMovieCell", for: indexPath)
        cell.textLabel?.text = reviews[indexPath.row].title
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReviewDatailSegue" {
            if let destination = segue.destination as? ReviewDetailController {
                destination.movie = reviews[tableView.indexPathForSelectedRow!.row]
            }
        }
    }

}

