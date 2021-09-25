//
//  DetalleLIstaMesesViewController.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/9/21.
//

import UIKit

class DetalleLIstaMesesViewController: UIViewController {
    
    var mesSeleccionado: String?
    
    @IBOutlet weak var mesSeleccionadoLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mesSeleccionadoLBL.text = mesSeleccionado
        // Do any additional setup after loading the view.
    }


}
