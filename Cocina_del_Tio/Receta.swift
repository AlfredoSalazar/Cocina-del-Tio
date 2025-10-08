//
//  Receta.swift
//  Cocina_del_Tio
//
//  Created by JOSE ALFREDO SALAZAR RIVERA on 07/10/25.
//

import Foundation
import UIKit
class Receta: NSObject
{
    var nombre:String!
    var imagen:UIImage!
    var tiempo:Int!
    var ingredientes:[String]!
    var pasos:[String]!
    init(nombre:String, imagen:UIImage, tiempo:Int, ingredientes:[String], pasos:[String])
    {
        self.nombre=nombre
        self.imagen=imagen
        self.tiempo=tiempo
        self.ingredientes=ingredientes
        self.pasos=pasos
    }
}
