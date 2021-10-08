//
//  LoginViewController.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Variables
    var usuarioLogado = false
    
    // MARK: - IBOutlest
    
    @IBOutlet weak var usuarioTF: UITextField!
    @IBOutlet weak var contrasenaTF: UITextField!
    
    // MARK: - IBActions
    
    @IBAction func loginACTION(_ sender: Any) {
        if datosCompletos() {
            self.usuarioLogado = true
            Utils.Constantes().kPreferences.set(self.usuarioTF.text, forKey: Utils.Constantes().kUsuario)
            Utils.Constantes().kPreferences.set(self.contrasenaTF.text, forKey: Utils.Constantes().kContrasena)
            Utils.Constantes().kPreferences.set(self.usuarioLogado, forKey: Utils.Constantes().kUsuarioLogado)
            
            self.borrarDatosVista()
            
        } else {
            self.present(Utils.muestraAlerta(titulo: "Hey!",
                                             mensaje: "Rellena todos los campos por favor"),
                         animated: true,
                         completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Metodos privados
    private func datosCompletos() -> Bool {
        return !(self.usuarioTF.text?.isEmpty ?? false) && !(self.contrasenaTF.text?.isEmpty ?? false)
    }
    
    private func borrarDatosVista() {
        self.usuarioTF.text = ""
        self.contrasenaTF.text = ""
        self.navegaZonaPrivada()
    }
    
    private func navegaZonaPrivada() {
        let vc = HomeTabBarCoordinator.viewController()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }


}
