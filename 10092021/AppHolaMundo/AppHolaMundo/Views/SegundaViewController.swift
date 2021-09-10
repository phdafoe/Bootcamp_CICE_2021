//
//  SegundaViewController.swift
//  AppHolaMundo
//
//  Created by Andres Felipe Ocampo Eljaiek on 10/9/21.
//

import UIKit

class SegundaViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var holaMundoSegundaVCLBL: UILabel!
    @IBOutlet weak var saludoEspecialSegundaVCLBL: UILabel!
    @IBOutlet weak var salidoATodosSegundaVCBTN: UIButton!
    @IBOutlet weak var constAlturaSegundaVCBoton: NSLayoutConstraint!
    
    // MARK: - IBActions
    @IBAction func salidoATodosSegundaVCACTION(_ sender: Any) {
        self.holaMundoSegundaVCLBL.text = "Hola CICE"
        self.saludoEspecialSegundaVCLBL.text = "Adios a todos"
        self.salidoATodosSegundaVCBTN.setTitle("Aqui de nuevo !", for: .normal)
        self.constAlturaSegundaVCBoton.constant = 87.0
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
