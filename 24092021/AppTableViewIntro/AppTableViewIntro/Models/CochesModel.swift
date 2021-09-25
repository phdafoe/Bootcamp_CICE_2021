//
//  CochesModel.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/9/21.
//

import Foundation
import UIKit

class CochesModelObject: NSObject {
    
    // declarar las variables de nuestro modelo
    var nombre: String?
    var color: String?
    var imagen: UIImage?
    
    // iniciamos el contructor
    init(nombre: String, color: String, imagen: UIImage) {
        self.nombre = nombre
        self.color = color
        self.imagen = imagen
        super.init()
    }
}

struct CochesModel {
    
    var nombre: String?
    var color: String?
    var imagen: UIImage?

}
