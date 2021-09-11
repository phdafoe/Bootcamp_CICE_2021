//
//  ViewController.swift
//  AppAlertas
//
//  Created by Andres Felipe Ocampo Eljaiek on 11/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables locales
    var loginTextField: UITextField?
    var passwordTextField: UITextField?
    
    
    // MARK: - IBActions
    
    @IBAction func showAlertController(_ sender: AnyObject) {
        
        switch sender.tag {
        case 0:
            // Alert Simple
            let alertVC = UIAlertController(title: "Alert Controller Simple",
                                            message: "Controller es la presentacion por defecto",
                                            preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.muestraSaludoOK()
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                self.muestraSaludoCancel()
            }
            
            alertVC.addAction(okAction)
            alertVC.addAction(cancelAction)
            
            present(alertVC, animated: true, completion: nil)
            
        case 1:
            // Alert Con un TextField
            let alertVCTF = UIAlertController(title: "Alert Controller con TextField",
                                              message: "Controller es la presentacion por defecto",
                                              preferredStyle: .alert)
            
            alertVCTF.addAction(UIAlertAction(title: "OK",
                                              style: .default,
                                              handler: { _ in
                                                self.muestraSaludoOK()
                                                let viewConStory = self.storyboard?.instantiateViewController(identifier: "SegundaViewController")
                                                if let vc = viewConStory{
                                                    self.show(vc, sender: nil)
                                                }
                                              }))
            
            alertVCTF.addAction(UIAlertAction(title: "Cancel",
                                              style: .cancel,
                                              handler: { _ in
                                                self.muestraSaludoCancel()
                                              }))
            
            alertVCTF.addTextField { textField in
                self.loginTextField = textField
                self.loginTextField?.placeholder = "Introduce tu Usuario !"
            }
            
            present(alertVCTF, animated: true, completion: nil)
            
        case 2:
            // Alert con Login y Password
            let alertVCLP = UIAlertController(title: "Alert Controller con Login y Password",
                                              message: "Controller es la presentacion por defecto",
                                              preferredStyle: .alert)
            alertVCLP.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                let viewConStory = self.storyboard?.instantiateViewController(identifier: "TerceraViewController")
                if let vc = viewConStory{
                    self.present(vc, animated: true) {
                        self.muestraSaludoOK()
                    }
                }
            }))
            
            alertVCLP.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                self.muestraSaludoCancel()
            }))
            
            alertVCLP.addTextField { loginTF in
                self.loginTextField = loginTF
                self.loginTextField?.placeholder = "Introduce tu Usuario !"
            }
            
            alertVCLP.addTextField { passwordTF in
                self.passwordTextField = passwordTF
                self.passwordTextField?.placeholder = "Introduce tu Password !"
                self.passwordTextField?.isSecureTextEntry = self.muestraPassword()
            }
            
            present(alertVCLP, animated: true, completion: nil)
            
        case 3:
            // Alert Multiples botones
            let alertVCMB = UIAlertController(title: "Alert Controller con Multiples botones",
                                              message: "Controller es la presentacion por defecto",
                                              preferredStyle: .alert)
            
            alertVCMB.addAction(UIAlertAction(title: "Uno", style: .default, handler: { _ in
                self.choosePhotoLibrary()
            }))
            
            alertVCMB.addAction(UIAlertAction(title: "Dos", style: .destructive, handler: nil))
            alertVCMB.addAction(UIAlertAction(title: "Tress", style: .cancel, handler: nil))
            alertVCMB.addAction(UIAlertAction(title: "Cuatro", style: .default, handler: nil))
            alertVCMB.addAction(UIAlertAction(title: "Cinco", style: .destructive, handler: nil))
            alertVCMB.addAction(UIAlertAction(title: "Seis", style: .default, handler: nil))
            alertVCMB.addAction(UIAlertAction(title: "Siete", style: .destructive, handler: nil))
            
            self.present(alertVCMB, animated: true, completion: nil)
            
        case 4:
            // Action Sheet
            let actionSheetVC = UIAlertController(title: "Action Sheet Controller",
                                              message: "Controller es la presentacion por defecto",
                                              preferredStyle: .actionSheet)
            
            actionSheetVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            actionSheetVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            actionSheetVC.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: nil))
            
            self.present(actionSheetVC, animated: true, completion: nil)
        
            
        default:
            break
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Metodos privados
    func muestraSaludoOK() {
        print("has pulsado el boton OK!!")
    }
    
    func muestraSaludoCancel() {
        print("has pulsado el boton Cancel!!")
    }
    
    func muestraPassword() -> Bool {
        true
    }
    
    func choosePhotoLibrary() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }


}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}




