//
//  ReviewsPageViewController.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 3/19/25.
//

import UIKit

class ReviewsPageViewController: UIPageViewController {
    let reviews = [
        Movie(id:"1",title: "IronMan 1",rating: 5, date: Date.now),
        Movie(id:"2",title: "IronMan 2",rating: 6, date: Date.now),
        Movie(id:"3",title: "IronMan 3",rating: 7, date: Date.now)
        
    ]
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
