//
//  Utils.swift
//  AppDatePicker_PickerView
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/9/21.
//

import Foundation
import UIKit

class Utils {
    
    static let shared = Utils()
    
    func configPickerView(tag: Int,
                          textField custom: UITextField,
                          arrayData data: [String],
                          delegate customDelegate: UIPickerViewDelegate,
                          datasource customDatasource: UIPickerViewDataSource) {
        
        let pickerView = UIPickerView()
        pickerView.delegate = customDelegate
        pickerView.dataSource = customDatasource
        pickerView.tag = tag
        custom.inputView = pickerView
        custom.text = data[0]
        
    }
}


