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
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var ratingButton: UIButton!
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    var recipe: Recipe!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeImageView.image = self.recipe.image
        
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25) //Color de fondo de la tabla.
        self.tableView.tableFooterView = UIView(frame: CGRect.zero) //Esto es para, en caso de que la tabla sea corta, no aparezcan celdas al final, que no tengan tamaño.
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
        self.title = recipe.name
        
        self.tableView.estimatedRowHeight = 44.0 //Parte, como guía, de un tamaño de celda aproximado
        self.tableView.rowHeight = UITableViewAutomaticDimension //dimensiona automáticamente el alto de la celda
        
        self.ratingButton.setImage(UIImage(named: self.recipe.rating), for: .normal)//Añadimos la carita nada mas inicializar
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = false //Esto es para mostrar la barra cuando haces un swipe.
        navigationController?.setNavigationBarHidden(false, animated: true)//Esto es para mostrar la barra cuando haces un swipe.
    }
    
    @IBAction func close(segue: UIStoryboardSegue){ //Para seleccionar la carita en función de si me gusta o no
        
        if let reviewVC = segue.source as? ReviewViewController{
            if let rating = reviewVC.ratingSelected{
                self.recipe.rating = rating
                self.ratingButton.setImage(UIImage(named: self.recipe.rating), for: .normal)
            }
        }
        
    }

}


extension DetailViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
        
        cell.backgroundColor = UIColor.clear //Elimina el color de fondo de las celdas con datos.
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Nombre:"
                cell.valueLabel.text = self.recipe.name
            case 1:
                cell.keyLabel.text = "Tiempo:"
                cell.valueLabel.text = "\(self.recipe.time!) min"
            /*case 2:
                cell.keyLabel.text = "Favorita:"
                if self.recipe.isFavourite{
                    cell.valueLabel.text = "Si"
                }else{
                    cell.valueLabel.text = "no"
                }*/
            case 3:
                cell.keyLabel.text = "Ingredientes"
                cell.valueLabel.text = "\(self.recipe.ingredients!)"
            default:
                break
            }
        case 1:
            if indexPath.row == 0{
                cell.keyLabel.text = "Ingredientes:"
            }else{
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0{
                cell.keyLabel.text = "Pasos a seguir:"
            }else{
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        return title
    }
    
}


extension DetailViewController : UITableViewDelegate{
    
    
}
