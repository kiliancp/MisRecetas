//
//  DetailViewController.swift
//  MisRecetas
//
//  Created by KILIAN CABRERA PÉREZ on 19/10/16.
//  Copyright © 2016 KILIAN CABRERA PÉREZ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var recipeImageView: UIImageView!
    
    var recipe : Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.recipeImageView.image = self.recipe.image
    }

    
}
