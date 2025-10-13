//
//  VCDetalles.swift
//  Cocina_del_Tio
//
//  Created by JOSE ALFREDO SALAZAR RIVERA on 09/10/25.
//

import UIKit

class VCDetalles: UIViewController
{

    var RecetaDetalle:Receta!
    
    @IBOutlet weak var tvTabla: UITableView!
    @IBOutlet weak var imgReceta: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.imgReceta.image = self.RecetaDetalle.imagen
        lblNombre.text = self.RecetaDetalle.nombre
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
