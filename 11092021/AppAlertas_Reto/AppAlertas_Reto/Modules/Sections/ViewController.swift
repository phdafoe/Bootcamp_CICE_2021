//
//  ViewController.swift
//  AppAlertas_Reto
//
//  Created by Andres Felipe Ocampo Eljaiek on 11/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBActions
    @IBAction func showAlertViewController(sender: UIButton) {
        
        switch sender.tag {
        case 0:
            let alertVC = UIAlertController(title: "Esta es una Alerta", message: "Vamos a por todas", preferredStyle: .alert)
            
            alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.choosePhotoLibrary()
            }))
            
            alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                let storyboardViewControllerNavigation = self.storyboard?.instantiateViewController(identifier: "SegundaViewController")
                if let vc = storyboardViewControllerNavigation {
                    self.show(vc, sender: nil)
                }
            }))
            
            alertVC.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                let storyboardViewControllerModal = self.storyboard?.instantiateViewController(identifier: "TerceraViewController")
                if let vc = storyboardViewControllerModal {
                    self.present(vc, animated: true, completion: nil)
                }
            }))
            
            self.present(alertVC, animated: true, completion: nil)
            
        case 1:
            
            let alertVC = UIAlertController(title: "Esta es una Alerta", message: "Vamos a por todas", preferredStyle: .actionSheet)
            
            alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.choosePhotoLibrary()
            }))
            
            alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                let storyboardViewControllerNavigation = self.storyboard?.instantiateViewController(identifier: "SegundaViewController")
                if let vc = storyboardViewControllerNavigation {
                    self.show(vc, sender: nil)
                }
            }))
            
            alertVC.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                let storyboardViewControllerModal = self.storyboard?.instantiateViewController(identifier: "TerceraViewController")
                if let vc = storyboardViewControllerModal {
                    self.present(vc, animated: true, completion: nil)
                }
            }))
            
            self.present(alertVC, animated: true, completion: nil)
            
            
            
        default:
            break
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    func choosePhotoLibrary() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {}


