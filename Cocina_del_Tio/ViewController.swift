//
//  ViewController.swift
//  Cocina_del_Tio
//
//  Created by JOSE ALFREDO SALAZAR RIVERA on 07/10/25.
//

import UIKit

class ViewController: UITableViewController
{
    var recetas:[Receta]=[]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        var receta=Receta(nombre: "Huevos Estrellados",imagen:#imageLiteral(resourceName: "huevos"),
                          tiempo:10,
                          ingredientes:["Huevos","Tocino","Aceite"],
                          pasos: ["Romper los huevos",
                                 "Freir los huevos",
                                 "Freir el tocino"])
        recetas.append(receta)
        
        receta = Receta(nombre: "Pizza de Peperoni",imagen:#imageLiteral(resourceName: "pizza"),
        tiempo:10,
        ingredientes:["/masa para pizza","Pepperoni","Salsa tomate"],
        pasos: ["Dar forma a la masa",
               "Agregar la salsa de tomate",
               "Agregar pepperoni",
                "Meter al Horno",])
        recetas.append(receta)
        
        receta = Receta(nombre: "Hamburguesa con queso",imagen:#imageLiteral(resourceName: "burguer"),
                        tiempo:10,
                        ingredientes:["/masa para pizza","Pepperoni","Salsa tomate"],
                        pasos: ["Dar forma a la masa",
                               "Agregar la salsa de tomate",
                               "Agregar pepperoni",
                                "Meter al Horno",])
        recetas.append(receta)

        
        receta = Receta(nombre: "Ensalada Cesar",imagen:#imageLiteral(resourceName: "ensalada"),
                        tiempo:10,
                        ingredientes:["/masa para pizza","Pepperoni","Salsa tomate"],
                        pasos: ["Dar forma a la masa",
                               "Agregar la salsa de tomate",
                               "Agregar pepperoni",
                                "Meter al Horno",])
        recetas.append(receta)
        
    }
   //MARK: -UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.recetas.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recip = recetas[indexPath.row]
        let IDCelda = "CeldaReceta"
        let Celda = tableView.dequeueReusableCell(withIdentifier: IDCelda, for: indexPath) as! CeldadeRecetas
        Celda.ImagenReceta.image=recip.imagen
        Celda.lblnombrereceta.text=recip.nombre
        Celda.lblTiemporeceta.text="Tiempo:\(recip.tiempo!) min"
        Celda.lblIngredientesrecetas.text="Ingredientes: \(recip.ingredientes.count)"
        
        

        return Celda
    }
    // MARK: SWIPEACTIONS
    override func tableView(_ tableView: UITableView,
                            trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
                            -> UISwipeActionsConfiguration? {

        let receta = self.recetas[indexPath.row]

        // BORRAR
        let borrar = UIContextualAction(style: .destructive, title: "Borrar") { [weak self] (accion, view, completionHandler) in
            self?.recetas.remove(at: indexPath.row)
            self?.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        borrar.backgroundColor = .red

        // COMPARTIR
        let compartir = UIContextualAction(style: .normal, title: "Compartir") { [weak self] (accion, view, completionHandler) in
            let texto = "Estoy viendo la receta de \(receta.nombre!)"
            let activityController = UIActivityViewController(activityItems: [texto], applicationActivities: nil)
            self?.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        compartir.backgroundColor = .blue

        return UISwipeActionsConfiguration(actions: [borrar, compartir])
    }

}

