//
//  ViewController.swift
//  AppHolaMundo
//
//  Created by Andres Felipe Ocampo Eljaiek on 10/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var holaMundoLBL: UILabel!
    @IBOutlet weak var saludoEspecialLBL: UILabel!
    @IBOutlet weak var salidoATodosBTN: UIButton!
    @IBOutlet weak var constAlturaBoton: NSLayoutConstraint!
    
    // MARK: - IBActions
    @IBAction func salidoATodosACTION(_ sender: Any) {
        self.holaMundoLBL.text = "Hola al Bootcamp de iOS en CICE"
        self.saludoEspecialLBL.text = "Adios a todos y nos vamos aun descanso !!"
        self.salidoATodosBTN.setTitle("Aqui de nuevo !", for: .normal)
        self.salidoATodosBTN.layer.cornerRadius = 10
        self.constAlturaBoton.constant = 67.0
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Aqui estamos currando a tope")
        
        // Do any additional setup after loading the view.
    }


}

