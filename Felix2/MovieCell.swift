//
//  MovieCell.swift
//  Felix2
//
//  Created by Parham Armani on 4/14/20.
//  Copyright © 2020 Parham Armani. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImageViewLabel: UIImageView!
    @IBOutlet weak var movieDescLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
