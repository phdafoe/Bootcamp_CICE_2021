//
//  Utils.swift
//  AppUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/10/21.
//

import Foundation
import UIKit

class Utils{
    
    static let shared = Utils()
    
    struct Constantes {
        let kNombre = "NOMBRE"
        let kApellido = "APELLIDO"
        let kDireccion = "DIRECCION"
        let kTelefono = "TELEFONO"
        let kFechaActualizacion = "FECHA_ACTUALIZACION"
        let kImage = "IMAGE_PERFIL"
        let kUsuarioLogado = "USUARIO_LOGADO"
        let kPrefs = UserDefaults.standard
    }
    
    func muestraAlerta(titulo: String, mensaje: String, completionHandler: ((UIAlertAction) -> Void)? ) -> UIAlertController {
        let alertVC = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: completionHandler))
        return alertVC
    }
    
}
