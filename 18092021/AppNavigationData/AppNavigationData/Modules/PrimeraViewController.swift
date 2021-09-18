//
//  PrimeraViewController.swift
//  AppNavigationData
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/9/21.
//

import UIKit

class PrimeraViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navegacion
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        if segue.identifier == "segueV2"{
            // 2
            if !(self.nombreTF.text?.isEmpty ?? false) && !(self.apellidoTF.text?.isEmpty ?? false) {
                // 3
                let ventana2VC = segue.destination as! SegundaViewController
                ventana2VC.datosUsuario.nombreData = self.nombreTF.text
                ventana2VC.datosUsuario.apellidoData = self.apellidoTF.text
                
            } else {
                // 4
                self.present(Utils.shared.showAlertVC("Estimado usuario",
                                                      message: "Por favor introduce los datos necesarios para continuar"),
                             animated: true,
                             completion: nil)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Logout
    @IBAction func cerrarVC(segue: UIStoryboardSegue) {
        print("sesion cerrada")
    }

}
