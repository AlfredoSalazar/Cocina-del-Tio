//
//  VCDetalles.swift
//  Cocina_del_Tio
//
//  Created by JOSE ALFREDO SALAZAR RIVERA on 09/10/25.
//

import UIKit

class VCDetalles: UIViewController
{
    var RecetaDetalle: Receta!
    
    @IBOutlet weak var tvTabla: UITableView!
    @IBOutlet weak var imgReceta: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.imgReceta.image = self.RecetaDetalle.imagen
        lblNombre.text = self.RecetaDetalle.nombre
        
        imgReceta.layer.borderWidth = 2
        imgReceta.layer.borderColor = UIColor.white.cgColor
        imgReceta.layer.shadowColor = UIColor.black.cgColor
        imgReceta.layer.shadowOpacity = 0.3
        imgReceta.layer.shadowOffset = CGSize(width: 0, height: 2)
        imgReceta.layer.shadowRadius = 4
        imgReceta.layer.cornerRadius = 20
        imgReceta.clipsToBounds = true
    }
}

// MARK: - UITableViewDataSource
extension VCDetalles: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section {
        case 0:
            return 3
        case 1:
            return self.RecetaDetalle.ingredientes.count
        case 2:
            return self.RecetaDetalle.pasos.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let Celda = tableView.dequeueReusableCell(withIdentifier: "IdCeldaDetalle", for: indexPath) as! CeldaDetalle
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                Celda.lblKey.text = "Nombre:"
                Celda.lblValor.text = self.RecetaDetalle.nombre!
            case 1:
                Celda.lblKey.text = "Tiempo:"
                Celda.lblValor.text = "\(self.RecetaDetalle.tiempo!) min"
            case 2:
                Celda.lblKey.text = "Favorito:"
                if self.RecetaDetalle.esFavorito {
                    Celda.lblValor.text = "Sí"
                } else {
                    Celda.lblValor.text = "No"
                }
            default:
                break
            }
            
        case 1: // Ingredientes
            Celda.lblKey.text = "Ingrediente:"
            Celda.lblValor.text = self.RecetaDetalle.ingredientes[indexPath.row]
            
        case 2: // Pasos
            if indexPath.row == 0 {
                Celda.lblKey.text = "Pasos:"
            } else {
                Celda.lblKey.text = ""
            }
            Celda.lblValor.text = self.RecetaDetalle.pasos[indexPath.row]
            
        default:
            break
        }
        
        return Celda
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        var titulo = ""
        switch section {
        case 0:
            titulo = "Info"
        case 1:
            titulo = "Ingredientes"
        case 2:
            titulo = "Pasos"
        default:
            break
        }
        return titulo
    }
}
