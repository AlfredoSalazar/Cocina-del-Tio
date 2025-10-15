//
//  CeldaDetalle.swift
//  Cocina_del_Tio
//
//  Created by JOSE ALFREDO SALAZAR RIVERA on 14/10/25.
//

import UIKit

class CeldaDetalle: UITableViewCell
{
    
    @IBOutlet weak var lblKey: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    override func awakeFromNib(){
        super.awakeFromNib()
        //inicializacion de codigo
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
