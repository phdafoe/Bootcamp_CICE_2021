//
//  SegundaViewController.swift
//  AppDatePicker_PickerView
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/9/21.
//

import UIKit

class SegundaViewController: UIViewController {
    
    // MARK: - Variables
    var localidadesArrayData = ["Salamanka", "la Fatina", "Muelcarra", "Gentas"]
    var codigopostalArrayData = ["28001", "28010", "28034", "28000"]
    var prioridadTeletrabajoArrayData = ["Alta", "Media", "Baja"]
    var fotosPerfilArrayData = ["felipe.jpg", "maria.jpg", "felipe.jpg"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var localidadesTF: UITextField!
    @IBOutlet weak var codigoPOstalTF: UITextField!
    @IBOutlet weak var prioridadTeletrabajoTF: UITextField!
    @IBOutlet weak var fotosPerfilTF: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configPickerView(tag: 1,
                         textField: localidadesTF,
                         arrayData: localidadesArrayData,
                         delegate: self,
                         datasource: self)
        
        configPickerView(tag: 2,
                         textField: codigoPOstalTF,
                         arrayData: codigopostalArrayData,
                         delegate: self,
                         datasource: self)
        
        configPickerView(tag: 3,
                         textField: prioridadTeletrabajoTF,
                         arrayData: prioridadTeletrabajoArrayData,
                         delegate: self,
                         datasource: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension SegundaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return localidadesArrayData.count
        case 2:
            return codigopostalArrayData.count
        default:
            return prioridadTeletrabajoArrayData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return localidadesArrayData[row]
        case 2:
            return codigopostalArrayData[row]
        default:
            return prioridadTeletrabajoArrayData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            self.localidadesTF.text = localidadesArrayData[row]
        case 2:
            self.codigoPOstalTF.text = codigopostalArrayData[row]
        default:
            self.prioridadTeletrabajoTF.text = prioridadTeletrabajoArrayData[row]
            self.fotosPerfilTF.image = UIImage(named: fotosPerfilArrayData[row])
        }
    }
    
 
}
