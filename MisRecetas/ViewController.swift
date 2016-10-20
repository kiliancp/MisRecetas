//
//  ViewController.swift
//  MisRecetas
//
//  Created by KILIAN CABRERA PÉREZ on 17/10/16.
//  Copyright © 2016 KILIAN CABRERA PÉREZ. All rights reserved.
//

import UIKit

//Se puede, en el view controler, insertar una tabla, o crear un table view controler. La diferencia es que la primera es insertar una tabla en el VC (Hay que programar los delegados) y la segunda, la tabla es directamente el VC.

class ViewController: UITableViewController /*Para la primera opción*/ { //UIViewControler, UITableViewDataSource, UITableViewDelegate, para la segunda opción

    /*Hay dos opciones para crear la aplicación, una con un array, del tipo:
     var recipes = ["Tortilla de Papas", "Espinacas al Dente", "Pizza Marinera"]
     pero si queremos que la lista tenga una imagen, hay que crear otro array con las imágenes, y si queremos los ingredientes, pues otro array con los mismos.
     Por lo tanto es muy complejo desarrollarlo de esta manera.
     Lo suyo, en estos casos, es tener un modelo de datos, creando una clase*/
    
    var recipes : [Recipe] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view, typically from a nib.
        
        

        
        
        
        var recipe = Recipe(name: "Tortilla de Papas",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingredients: ["Papas", "Huevos", "Cebolla"],
                            steps: ["Pelamos las papas y la cebolla",
                                    "Cortar las papas y la cebolla y sofreir",
                                    "Batir los huevos y echarlos durante un minuto a la sarten con el resto"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza Margarita",
                        image: #imageLiteral(resourceName: "pizza"),
                        time: 60,
                        ingredients: ["Harina", "Levadura", "Aceite", "Tomate", "Sal", "Queso", "Jamón"],
                        steps: ["Hacemos la masa con la harina, levadura, aceite y sal",
                                "Dejamos reposar la masa 30 minutos",
                                "Extendemos la masa sobre una bandeja y añadimos el resto de ingredientes",
                                "Hornear durante 12 min"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con Queso",
                        image: #imageLiteral(resourceName: "hamburguesa"),
                        time: 15,
                        ingredients: ["Pan de hamburguesa", "Lechuga", "Tomate", "Queso", "Carne de hamburguesa"],
                        steps: ["Poner al fuego la carne al gusto",
                                "Montar la hamburguesa con sus ingredientes entre los panes"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada César",
                        image: #imageLiteral(resourceName: "ensaladaCesar"),
                        time: 15,
                        ingredients: ["Lechuga", "Tomates", "Cebolla", "Pimiento", "Salsa César", "Pollo Empanado"],
                        steps: ["Limpiar todas las verduras y trocearlas",
                                "Freir el pollo al gusto",
                                "Juntar todos los ingredientes en una ensaladera y servir con salsa César por encima"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Huevos al Plato",
                        image: #imageLiteral(resourceName: "huevosPlato"),
                        time: 30,
                        ingredients: ["Huevos", "Papas", "Chorizo", "Salsa de tomate", "Esparragos", "Guisantes", "Cebolla"],
                        steps: ["Se cortan las papas y la cebolla en rodajas",
                                "Se ponen en una cazuela de barro, o metálica, una capa de rodajas de cebolla y una de papas",
                                "Se añade el chorizo en tacos y se cubre con la salsa de tomate",
                                "Se añade uno o dos huevos encima, y se adorna con los espárragos y los guisantes",
                                "Se hornean a 200º durante 20 minutos o hasta que el huevo y las papas estén cocinados"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Papas Arrugadas con Mojo",
                        image: #imageLiteral(resourceName: "papasMojo"),
                        time: 25,
                        ingredients: ["Papas nuevas pequeñas", "Cáscara de limón", "Ajos", "Aceite de Oliva", "Pimentón", "Cominos", "Vinagre", "Almendras", "Sal Marina"],
                        steps: ["Se lavan las papas bién y se ponen a cocer con la cáscara del limón y abundante sal marina gruesa, sin que el agua las cubra",
                                "Una vez en su punto se retira el sobrante de agua y se vuelven a poner al fuego para secarlas, sacudíendolas constantemente, para que arruguen",
                                "Se prepara el mojo, batiéndo el aceite de oliva, los ajos, el pimentón las almendras y una pizca de sal y vinagre",
                                "Sirvase las papas con el mojo por encima o en cazuela aparte"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Cookies con Macadamias",
                        image: #imageLiteral(resourceName: "macadamiaCookies"),
                        time: 25,
                        ingredients: ["Harina Leudante", "Polvo de hornear", "Sal", "Mantequilla", "Azucar Mascabado", "Azucar Blanca", "Esencia de Vainilla", "Huevo", "Chispas de chocolate blanco", "Nueces de Macadamia"],
                        steps: ["Precalienta el horno a 165 °C. Cubre 2 charolas para hornear con papel para hornear",
                                "Mezcla la harina con el polvo para hornear y la sal. Luego cierne y reserva",
                                "En un tazón mediano, bate la mantequilla derretida junto con ambos tipos de azúcar hasta acremar. Incorpora la vainilla, huevo y yema, y sigue batiendo hasta lograr una consistencia tersa y cremosa. Agrega la harina y mezcla sólo hasta incorporar",
                                "Envuelve el chocolate y las nueces de Macadamia. Coloca cucharadas copeteadas de la masa sobre las charolas para hornear, dejando suficiente espacio para que se expandan durante el proceso de cocción",
                                "Hornea de 15 a 17 minutos, hasta que de los bordes estén ligeramente dorados. Deja que las galletas se enfríen en las charolas durante 5 minutos, luego coloca sobre rejillas de alambre para que se enfríen completamente"])
        recipes.append(recipe)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true //Esto es para ocultar la barra cuando haces un swipe.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    //MARK: - UITableViewDataSource
    //Estos tres métodos vienen directamente del UITableViewController
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let CellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! RecipeCell
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "Tiempo ejecución: \(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        /*if recipe.isFavourite{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }*/
        
        //Vamos a hacer la imagen redonda, para ello usamos los métodos de la clase CALayer
        //Esto se puede hacer de la manera siguiente, o mediante el main storyboard, sin líneas de código. Comento estas
        /*cell.thumbnailImageView.layer.cornerRadius = 41.5
        cell.thumbnailImageView.clipsToBounds = true*/
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            self.recipes.remove(at: indexPath.row)
            
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la app del curso de ios10 con Juan Gabriel"
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
        }
        
        shareAction.backgroundColor = UIColor (red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        //Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        return[shareAction, deleteAction]
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*let recipe = self.recipes[indexPath.row]
        
        
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var favouriteActionTittle = "Favorito"
        var favouriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavourite{
            favouriteActionTittle = "No Favorito"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let favouritAction = UIAlertAction(title: favouriteActionTittle, style: favouriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        alertController.addAction(favouritAction)
        
        self.present(alertController, animated: true, completion: nil)*/
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
        

    }
    
}




