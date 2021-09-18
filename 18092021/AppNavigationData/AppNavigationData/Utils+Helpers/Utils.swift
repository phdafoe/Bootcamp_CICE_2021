//
//  Utils.swift
//  AppNavigationData
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/9/21.
//

import Foundation
import UIKit

class Utils {
    
    static let shared = Utils()
    
    /// custom showAlertVC
    /// - Parameters:
    ///   - title: title information to User
    ///   - text: message information to User
    /// - Returns: generic UIAlertController
    func showAlertVC(_ title: String,
                     message text: String) -> UIAlertController {
        
        let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertVC
    }
    
    /// custom showPicker
    /// - Parameters:
    ///   - tag: definition number for any View
    ///   - customTextField: customTextField when user show a pickerView in SuperView
    ///   - data: array data for any pickerView
    ///   - pickerDelegate: pickerDelegate send suscriber for ViewController
    ///   - pickerDatasource: pickerDatasource send suscriober for ViewController
    func showPicker(_ tag: Int,
                    textField customTextField: UITextField,
                    arrayData data: [String],
                    delegate pickerDelegate: UIPickerViewDelegate,
                    datsource pickerDatasource: UIPickerViewDataSource ) {
        
        let pickerView = UIPickerView()
        pickerView.delegate = pickerDelegate
        pickerView.dataSource = pickerDatasource
        pickerView.tag = tag
        customTextField.inputView = pickerView
        customTextField.text = data[0]
    }
    
}

struct DatosUsuarioModel {
    
    var nombreData: String?
    var apellidoData: String?
    var telefonoData: String?
    var direccionData: String?
    var edadPerroData: String?
    var codigoPostalData: String?
    var ciudadData: String?
    var posicionGeograficaData: String?
    
}
