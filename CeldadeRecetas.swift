//
//  CeldadeRecetas.swift
//  Cocina_del_Tio
//
//  Created by JOSE ALFREDO SALAZAR RIVERA on 08/10/25.
//

import UIKit

class CeldadeRecetas: UITableViewCell
{
@IBOutlet weak var ImagenReceta: UIImageView!

    @IBOutlet weak var lblnombrereceta: UILabel!
    @IBOutlet weak var lblTiemporeceta: UILabel!
    @IBOutlet weak var lblIngredientesrecetas: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
