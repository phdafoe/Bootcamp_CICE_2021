//
//  NuevaTareaViewController.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import UIKit

class NuevaTareaViewController: UIViewController {
    
    // MARK: - Variables
    let arrayPrioridad = ["ALTA", "MEDIA - ALTA", "MEDIA", "MEDIA - BAJA", "BAJA"]
    let nombreCategoria = "Sin Categoría"
    var fotoSeleccionada = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var nuevaTareaTF: UITextField!
    @IBOutlet weak var prioridadTF: UITextField!
    @IBOutlet weak var fechaTF: UITextField!
    @IBOutlet weak var categoriaLBL: UILabel!
    @IBOutlet weak var descripcionTextV: UITextView!
    @IBOutlet weak var imagenTareaImage: UIImageView!
    
    // MARK: - IBActions
    @IBAction func muestraCamaraACTION(_ sender: Any) {
        
    }
    
    @IBAction func muestraListaCategoría(_ sender: Any) {
        
    }
    
    @IBAction func salvarTareUserDeACTION(_ sender: Any) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    // MARK: - Metodos privados
    
    
}
