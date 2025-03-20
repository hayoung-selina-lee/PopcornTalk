//
//  ReviewDetailController.swift
//  PopcornTalk
//
//  Created by Hayoung Lee on 2/8/25.
//

import UIKit

class ReviewDetailController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = movie.title
        numberLabel.text = String(format: "#%03d", movie.rating)
    }
}
