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
        ingredientes:["Masa para pizza","Pepperoni","Salsa de tomate"],
        pasos: ["Dar forma a la masa",
               "Agregar la salsa de tomate",
               "Agregar pepperoni",
                "Meter al horno"])
        recetas.append(receta)
        
        receta = Receta(nombre: "Hamburguesa con queso",imagen:#imageLiteral(resourceName: "burguer"),
                        tiempo:10,
                        ingredientes:["Pan para hamburguesa","Carne de res","Queso","Lechuga","Tomate"],
                        pasos: ["Cocinar la carne",
                               "Armar la hamburguesa con pan y queso",
                               "Agregar verduras y salsas al gusto"])
        recetas.append(receta)

        
        receta = Receta(nombre: "Ensalada Cesar",imagen:#imageLiteral(resourceName: "ensalada"),
                        tiempo:10,
                        ingredientes:["Lechuga romana","Pollo","Crutones","Aderezo César","Queso parmesano"],
                        pasos: ["Cortar la lechuga y cocinar el pollo",
                               "Mezclar con aderezo César",
                               "Agregar crutones y queso parmesano"])
        recetas.append(receta)
        
        // Chilaquiles corregidos
        receta = Receta(nombre: "Chilaquiles",imagen:#imageLiteral(resourceName: "04_GreenChilaquilesRoastedTomatilloSauce_101_Cropped-copy"),
        tiempo:15,
        ingredientes:["Totopos","Salsa roja o verde","Crema","Queso fresco","Cebolla","Cilantro"],
        pasos: ["Calentar la salsa en una sartén",
               "Agregar los totopos y mezclar",
               "Servir con crema, queso, cebolla y cilantro"])
        recetas.append(receta)
        
        // Caldo de res corregido
        receta = Receta(nombre: "Caldo de res",imagen:#imageLiteral(resourceName: "KD-caldo-de-resrex-bljq-mediumSquareAt3X"),
                        tiempo:90,
                        ingredientes:["Carne de res con hueso","Zanahoria","Papa","Chayote","Elote","Repollo","Agua","Sal"],
                        pasos: ["Hervir la carne en agua con sal hasta que esté suave",
                               "Agregar las verduras y cocinar hasta que estén cocidas",
                               "Servir caliente con limón y chile al gusto"])
        recetas.append(receta)

        
        receta = Receta(nombre: "Tacos",imagen:#imageLiteral(resourceName: "2a3e8217-6ecf-43cd-b5ee-6a3e8f68da12"),
                        tiempo:20,
                        ingredientes:["Tortillas de maíz","Carne asada","Cilantro","Cebolla","Salsa"],
                        pasos: ["Cocinar o calentar la carne",
                               "Calentar las tortillas",
                               "Servir la carne en la tortilla",
                               "Agregar cilantro, cebolla y salsa al gusto"])
        recetas.append(receta)
        
        receta = Receta(nombre: "Sushi Empanizado",imagen:#imageLiteral(resourceName: "sushi"),
        tiempo:10,
        ingredientes:["Arroz cocido","Alga nori","Cangrejo"],
        pasos: ["Extiende la alga sobre una esterilla",
               "Agregar el arroz sin prensar",
               "Agregar cangrejo",
                "Enrollar, cortar y freír"])
        recetas.append(receta)
        
        receta = Receta(nombre: "Pasta Alfredo con Camaron",imagen:#imageLiteral(resourceName: "alfredopaste"),
                        tiempo:25,
                        ingredientes:["Fetuccini","Camarón crudo","Crema","Queso","Especias"],
                        pasos: ["Hervir el fetuccini",
                               "Limpiar y cocinar el camarón",
                               "Mezclar con crema, queso y especias"])
        recetas.append(receta)

        
        receta = Receta(nombre: "Bonneles",imagen:#imageLiteral(resourceName: "bonnneles"),
                        tiempo:20,
                        ingredientes:["Pollo en cubos","Pan molido","Aceite","Huevo","Leche"],
                        pasos: ["Mezclar huevo y leche",
                               "Hundir los cubos de pollo en la mezcla",
                               "Empanizar",
                                "Freír en aceite caliente"])
        recetas.append(receta)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "muestraDetalle"
        {
            if let indice = self.tableView.indexPathForSelectedRow
            {
                let VCDestino = segue.destination as! VCDetalles
                VCDestino.RecetaDetalle = self.recetas[indice.row]
            }
        }
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
        
        if recip .esFavorito
        {
            Celda.accessoryType = .checkmark
        }
        else
        {
            Celda.accessoryType = .none
        }
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
