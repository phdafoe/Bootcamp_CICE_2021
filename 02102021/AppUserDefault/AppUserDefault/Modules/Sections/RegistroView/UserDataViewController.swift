//
//  UserDataViewController.swift
//  AppUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/10/21.
//

import UIKit

class UserDataViewController: UIViewController {
    
    var existeFoto = false
    var usuarioLogado = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoTF: UITextField!
    @IBOutlet weak var direccionTF: UITextField!
    @IBOutlet weak var telefonoTF: UITextField!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var fechaActualizacionLBL: UILabel!
  
    // MARK: - IBACtions
    @IBAction func salvarDatosACTION(_ sender: Any) {
        if datosCumplimentados() {
            
            Utils.Constantes().kPrefs.set(self.nombreTF.text, forKey: Utils.Constantes().kNombre)
            Utils.Constantes().kPrefs.set(self.apellidoTF.text, forKey: Utils.Constantes().kApellido)
            Utils.Constantes().kPrefs.set(self.direccionTF.text, forKey: Utils.Constantes().kDireccion)
            Utils.Constantes().kPrefs.set(self.telefonoTF.text, forKey: Utils.Constantes().kTelefono)
            
            let imageData = self.imageImageView.image?.jpegData(compressionQuality: 0.5)
            Utils.Constantes().kPrefs.set(imageData, forKey: Utils.Constantes().kImage)
            
            let fechaActual = Date()
            Utils.Constantes().kPrefs.set(fechaActual, forKey: Utils.Constantes().kFechaActualizacion)
            
            self.present(Utils.shared.muestraAlerta(titulo: "Saluda a los chicos",
                                                    mensaje: "Estamos aprendido mucho de iOS",
                                                    completionHandler: { _ in
                
                self.usuarioLogado = true
                Utils.Constantes().kPrefs.set(self.usuarioLogado, forKey: Utils.Constantes().kUsuarioLogado)
                
                
                let vc = HomeTabBarCoordinator.homeTabBarVC()
                vc.modalTransitionStyle = .coverVertical
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }),
                         animated: true,
                         completion: nil)
            
        } else {
            
            self.present(Utils.shared.muestraAlerta(titulo: "Hola!", mensaje: "Cumplimenta todos los campos y la foto", completionHandler: nil),
                         animated: true,
                         completion: nil)
        }
    }
    
    @IBAction func recuperarDatosACTION(_ sender: Any) {
        self.muestraDatosActualizados()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionImageView()
    }
    
    private func muestraDatosActualizados() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        if let ultimaActualizacion = Utils.Constantes().kPrefs.object(forKey: Utils.Constantes().kFechaActualizacion) as? Date {
            self.fechaActualizacionLBL.text = "Ultima actualización: \(dateFormatter.string(from: ultimaActualizacion))"
        }
        
        if let imageData = Utils.Constantes().kPrefs.object(forKey: Utils.Constantes().kImage) as? Data {
            self.imageImageView.image = UIImage(data: imageData)
        }
        
        if let nombreDes = Utils.Constantes().kPrefs.string(forKey: Utils.Constantes().kNombre) {
            self.nombreTF.text = nombreDes
        }
        
        if let apellidoDes = Utils.Constantes().kPrefs.string(forKey: Utils.Constantes().kApellido) {
            self.apellidoTF.text = apellidoDes
        }
        
        if let direccionDes = Utils.Constantes().kPrefs.string(forKey: Utils.Constantes().kDireccion) {
            self.direccionTF.text = direccionDes
        }
        
        if let telefonoDes = Utils.Constantes().kPrefs.string(forKey: Utils.Constantes().kTelefono) {
            self.telefonoTF.text = telefonoDes
        }
    }
    
    private func datosCumplimentados() -> Bool {
        return !(nombreTF.text?.isEmpty ?? false) && !(apellidoTF.text?.isEmpty ?? false) && !(direccionTF.text?.isEmpty ?? false) && !(telefonoTF.text?.isEmpty ?? false) && existeFoto
    }
    
    private func configuracionImageView() {
        self.imageImageView.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(muestraSelectorFoto))
        self.imageImageView.addGestureRecognizer(tapGR)
    }
    
    @objc
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



}

extension UserDataViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickerImage = info[.originalImage] as? UIImage {
            self.imageImageView.contentMode = .scaleAspectFill
            self.imageImageView.image = pickerImage
            self.existeFoto = true
        }
        
        // Codigo defensivo para evitar bloqueos en el hilo principal de la vista
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
