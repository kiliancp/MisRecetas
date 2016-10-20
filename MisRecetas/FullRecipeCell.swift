//
//  FullRecipeCell.swift
//  MisRecetas
//
//  Created by KILIAN CABRERA PÉREZ on 19/10/16.
//  Copyright © 2016 KILIAN CABRERA PÉREZ. All rights reserved.
//

import UIKit

class FullRecipeCell: UITableViewCell {
    @IBOutlet var fullImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
