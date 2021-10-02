//
//  PerfilViewController.swift
//  AppUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/10/21.
//

import UIKit

class PerfilViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var nombreLBL: UILabel!
    @IBOutlet weak var apellidoLBL: UILabel!
    @IBOutlet weak var direccionLBL: UILabel!
    @IBOutlet weak var telefonoLBL: UILabel!
    @IBOutlet weak var fechaActualizacionLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.muestraDatosActualizados()
        self.configuracion()
        // Do any additional setup after loading the view.
    }
    
    private func configuracion() {
        self.imagenPerfil.layer.cornerRadius = self.imagenPerfil.frame.width / 2
        self.imagenPerfil.layer.borderWidth = 1
        self.imagenPerfil.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func muestraDatosActualizados() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        if let ultimaActualizacion = Utils.Constantes().kPrefs.object(forKey: Utils.Constantes().kFechaActualizacion) as? Date {
            self.fechaActualizacionLBL.text = "Ultima actualización: \(dateFormatter.string(from: ultimaActualizacion))"
        }
        
        if let imageData = Utils.Constantes().kPrefs.object(forKey: Utils.Constantes().kImage) as? Data {
            self.imagenPerfil.image = UIImage(data: imageData)
        }
        
        if let nombreDes = Utils.Constantes().kPrefs.string(forKey: Utils.Constantes().kNombre) {
            self.nombreLBL.text = nombreDes
        }
        
        if let apellidoDes = Utils.Constantes().kPrefs.string(forKey: Utils.Constantes().kApellido) {
            self.apellidoLBL.text = apellidoDes
        }
        
        if let direccionDes = Utils.Constantes().kPrefs.string(forKey: Utils.Constantes().kDireccion) {
            self.direccionLBL.text = direccionDes
        }
        
        if let telefonoDes = Utils.Constantes().kPrefs.string(forKey: Utils.Constantes().kTelefono) {
            self.telefonoLBL.text = telefonoDes
        }
    }



}
