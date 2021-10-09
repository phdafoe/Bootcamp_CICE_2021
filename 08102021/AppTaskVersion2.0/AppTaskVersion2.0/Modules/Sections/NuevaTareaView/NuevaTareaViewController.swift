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
    @IBOutlet weak var categoriaBTN: UIButton!
    @IBOutlet weak var salvarTareaBTN: UIButton!
    
    // MARK: - IBActions
    @IBAction func muestraCamaraACTION(_ sender: Any) {
        self.muestraSelectorFoto()
    }
    
    @IBAction func muestraListaCategoría(_ sender: Any) {
        let vc = CategoriaCoordinator.viewController(delegate: self)
        self.show(vc, sender: nil)
    }
    
    @IBAction func salvarTareUserDeACTION(_ sender: Any) {
        if validacionDatos() {
            
            let imageData: Data = self.imagenTareaImage.image!.jpegData(compressionQuality: 0.4)!
            
            SaveFavoritesPresenter.shared.addLocal(favorite: DownloadNewModel(pId: Int.random(in: 0..<999),
                                                                              pNewTask: self.nuevaTareaTF.text ?? "",
                                                                              pPriority: self.prioridadTF.text ?? "",
                                                                              pTaskDate: self.fechaTF.text ?? "",
                                                                              pTaskDescription: self.descripcionTextV.text ?? "",
                                                                              pTaskCategory: self.categoriaLBL.text ?? "",
                                                                              pTaskImage: imageData)) { result in
                if result != nil{
                    self.present(Utils.muestraAlerta(titulo: "Genial!!",
                                                     mensaje: "Los datos se han salvado correctamente"),
                                 animated: true) {
                        // Notificacion local (Push)
                        let localNotification = UILocalNotification()
                        localNotification.fireDate = Date(timeIntervalSinceNow: 5)
                        localNotification.alertBody = self.nuevaTareaTF.text
                        localNotification.timeZone = NSTimeZone.default
                        localNotification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
                        UIApplication.shared.scheduleLocalNotification(localNotification)
                        
                        // Limpiamos todos los datos una vez que se ha salvado en la base de datos local
                        self.limpiaDatosFormulario()
                        
                    }
                }
            
            } failure: { error in
                debugPrint(error ?? "")
            }

        } else {
            self.present(Utils.muestraAlerta(titulo: "Hey!!", mensaje: "Por favor rellena todos los campos y ten en cuenta seleccionar una fotografia de la libreria"), animated: true, completion: nil)
        }
    }
    
    
    @IBAction func muestraDatePicker(_ sender: UITextField) {
        // Aqui creamos el date picker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        // Do any additional setup after loading the view.
    }


    // MARK: - Metodos privados
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc
    func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        self.fechaTF.text = dateFormatter.string(from: sender.date)
    }
    
    private func configuracionUI(){
        self.title = "Nueva Tarea"
        
        // Aqui hacemos redondos los botones
        self.categoriaBTN.layer.cornerRadius = 16
        self.salvarTareaBTN.layer.cornerRadius = 16
        
        // Aqui redondeamos la imagen y le damos un borde
        self.imagenTareaImage.layer.cornerRadius = self.imagenTareaImage.frame.width / 8
        self.imagenTareaImage.layer.borderWidth = 1.2
        self.imagenTareaImage.layer.borderColor = UIColor.gray.cgColor
        
        // Aqui creamos el PickerView para la Prioridad
        let pickerView = UIPickerView()
        pickerView.delegate = self
        self.prioridadTF.inputView = pickerView
        self.prioridadTF.text = self.arrayPrioridad[0]
        
        self.categoriaLBL.text = self.nombreCategoria
    }
    
    
    func muestraSelectorFoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.muestraPhotoMenu()
        } else {
            self.muestraPhotoLibrary()
        }
    }
    
    private func muestraPhotoMenu(){
        let actionSheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheetVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheetVC.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: { _ in
            self.tomafoto()
        }))
        actionSheetVC.addAction(UIAlertAction(title: "Escoge de la libreria", style: .default, handler: { _ in
            self.muestraPhotoLibrary()
        }))
        self.present(actionSheetVC, animated: true, completion: nil)
    }
    
    private func muestraPhotoLibrary(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    private func tomafoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    private func validacionDatos() -> Bool {
        return !(self.nuevaTareaTF.text?.isEmpty ?? false) &&
        !(self.prioridadTF.text?.isEmpty ?? false) &&
        !(self.fechaTF.text?.isEmpty ?? false) &&
        !(self.categoriaLBL.text?.isEmpty ?? false) &&
        !(self.descripcionTextV.text?.isEmpty ?? false) &&
        fotoSeleccionada
    }
    
    private func limpiaDatosFormulario() {
        self.nuevaTareaTF.text = ""
        self.prioridadTF.text = ""
        self.fechaTF.text = ""
        self.descripcionTextV.text = "Coloca una descripción de tu tarea"
        self.imagenTareaImage.image = UIImage(named: "placeholder")
        self.categoriaLBL.text = self.nombreCategoria
    }
  
}

extension NuevaTareaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.arrayPrioridad.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.arrayPrioridad[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        44
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.prioridadTF.text = self.arrayPrioridad[row]
        
    }
}

extension NuevaTareaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imageDes = info[.originalImage] as? UIImage{
            self.imagenTareaImage.contentMode = .scaleAspectFill
            self.imagenTareaImage.image = imageDes
            self.fotoSeleccionada = true
        }
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension NuevaTareaViewController: CategoriaViewControllerOutputDelegate {
    
    func nombreCategoriaSeleccionada(_ viewController: UIViewController, withIndexPath categoriaSelecionada: String) {
        self.categoriaLBL.text = categoriaSelecionada
    }
    
    
}
