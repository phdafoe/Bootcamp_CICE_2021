//
//  SegundaViewController.swift
//  AppNavigationData
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/9/21.
//

import UIKit


class SegundaViewController: UIViewController {
    
    // MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    var edadPerro: Int?
    var nuevaEdadDelPerro: Int?
    
    // MARK: - IBOutlets
    @IBOutlet weak var nombreLBL: UILabel!
    @IBOutlet weak var apellidoLBL: UILabel!
    
    @IBOutlet weak var telefonoTF: UITextField!
    @IBOutlet weak var direccionTF: UITextField!
    @IBOutlet weak var calculaEdadPerro: UITextField!
    
    // MARK: - IBActions
    @IBAction func calculoEdadPerroACTION(_ sender: Any) {
        //1
        self.edadPerro = Int(self.calculaEdadPerro.text!)
        // 2
        if let edadPerroDes = self.edadPerro {
            //3
            self.nuevaEdadDelPerro = edadPerroDes * 7
            self.present(Utils.shared.showAlertVC("Edad de mi Perro",
                                                  message: "El calculo de la edad de mi perro es: \(self.nuevaEdadDelPerro ?? 0)"),
                         animated: true,
                         completion: nil)
        } else {
            // 4
            self.present(Utils.shared.showAlertVC("Estimado usuario",
                                                  message: "Por favor introduce la edad de tu perro para calcularla"),
                         animated: true,
                         completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configuredUI()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Metodos privados
    private func configuredUI() {
        self.nombreLBL.text = "mi Nombre es: \(datosUsuario.nombreData ?? "")"
        self.apellidoLBL.text = "mi Apellido es: \(datosUsuario.apellidoData ?? "")"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueV3"{
            
            if (self.telefonoTF.text?.isEmpty ?? true) &&
                (self.direccionTF.text?.isEmpty ?? true) &&
                (self.calculaEdadPerro.text?.isEmpty ?? true) {
                
                self.present(Utils.shared.showAlertVC("Hey",
                                                      message: "Por favor introduce datos en los campos de texto"),
                             animated: true,
                             completion: nil)
            } else {
                let ventana3VC = segue.destination as! TerceraViewController
                ventana3VC.datosUsuario.nombreData = datosUsuario.nombreData
                ventana3VC.datosUsuario.apellidoData = datosUsuario.apellidoData
                ventana3VC.datosUsuario.telefonoData = self.telefonoTF.text
                ventana3VC.datosUsuario.direccionData = self.direccionTF.text
                ventana3VC.datosUsuario.edadPerroData = "\(self.nuevaEdadDelPerro ?? 0)"
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
