//
//  ViewController.swift
//  AppDatePicker_PickerView
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var quesosArrayData = ["Mozzarella", "Gorgonzola", "Provolone", "Stilton", "Asiago"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var tituloQuesoLBL: UILabel!
    @IBOutlet weak var detalleTextoQuesoTV: UITextView!
    @IBOutlet weak var imagenQuesoIV: UIImageView!
    @IBOutlet weak var pickerQuesoPV: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.configPickerView()
    }

    
    // MARK: - Metodos privados
    private func configUI() {
        self.title = self.quesosArrayData[0]
        self.tituloQuesoLBL.text = self.quesosArrayData[0]
        self.imagenQuesoIV.image = UIImage(named: self.quesosArrayData[0])
        self.detalleTextoQuesoTV.text = "La mozzarella1 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
    }
    
    private func configPickerView() {
        self.pickerQuesoPV.delegate = self
        self.pickerQuesoPV.dataSource = self
    }

}

// MARK: - ViewController: UIPickerViewDelegate / UIPickerViewDataSource
extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.quesosArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        44
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.title = self.quesosArrayData[row]
        self.tituloQuesoLBL.text = self.quesosArrayData[row]
        self.imagenQuesoIV.image = UIImage(named: self.quesosArrayData[row])
        
        switch row {
        case 0:
            self.detalleTextoQuesoTV.text = "La mozzarella1 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
        case 1:
            self.detalleTextoQuesoTV.text = "La mozzarella1 (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta)."
        case 2:
            self.detalleTextoQuesoTV.text = "Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala."
        case 3:
            self.detalleTextoQuesoTV.text = "Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
        default:
            self.detalleTextoQuesoTV.text = "El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca."
        }
    }
}

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.quesosArrayData.count
    }
    
}


