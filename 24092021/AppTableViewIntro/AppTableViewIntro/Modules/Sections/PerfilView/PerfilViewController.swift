//
//  PerfilViewController.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/9/21.
//

import UIKit

class PerfilViewController: UIViewController {
    
    
    @IBOutlet weak var linkedInTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mi Perfil"
        self.configuracionTV()
        // Do any additional setup after loading the view.
    }

    private func configuracionTV(){
        // 1
        self.linkedInTableView.delegate = self
        self.linkedInTableView.dataSource = self
        // 2
        self.linkedInTableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
        self.linkedInTableView.register(UINib(nibName: PostsCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PostsCell.defaultReuseIdentifier)
    }
    
    // MARK: - Gestion de la camara
    private func muestraSelectorFoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.muestraPhotoLibrary()
        } else {
            self.muestraPhotoMenu()
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

extension PerfilViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellPerfil = self.linkedInTableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
            cellPerfil.delegate = self
            cellPerfil.configuracionCell(data: UserData(nombrePerfil: "Andrés Ocampo Eljaiek",
                                                        descripcionPerfil: "Senior Lead iOS Engineer en everis e Instructor de iOS en CICE, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran ",
                                                        puestoactualPerfil: "Lead iOS Engineer ",
                                                        usuarioTwitterPerfil: "@andrefelipeocam",
                                                        imagenPerfil: "thor"))
            return cellPerfil
        default:
            let cellPost = self.linkedInTableView.dequeueReusableCell(withIdentifier: PostsCell.defaultReuseIdentifier, for: indexPath) as! PostsCell
            cellPost.configuracionCell(data: "Senior Lead iOS Engineer en everis e Instructor de iOS en CICE, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran, Senior Lead iOS Engineer en everis e Instructor de iOS en CICE, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran, Senior Lead iOS Engineer en everis e Instructor de iOS en CICE, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran, Senior Lead iOS Engineer en everis e Instructor de iOS en CICE, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieranSenior Lead iOS Engineer en everis e Instructor de iOS en CICE, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran, Senior Lead iOS Engineer en everis e Instructor de iOS en CICE, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran")
            return cellPost
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 270
        default:
            return UITableView.automaticDimension
        }
    }
    
    
}

// MARK: - Output de la Interfaz de la PerfilCell
extension PerfilViewController: PerfilCellDelegate {
    
    func muestraAlerta(_ cell: UITableViewCell, info userData: UserData) {
        let alertVC = UIAlertController(title: userData.nombrePerfil, message: userData.descripcionPerfil, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func muestraPickerImageView(_ cell: UITableViewCell) {
        self.muestraSelectorFoto()
    }
    
    func navegaDetallePerfil(_ cell: UITableViewCell, info userData: UserData) {
        let vc = DetalleLIstaMesesViewController()
        vc.data = userData.nombrePerfil
        self.show(vc, sender: nil)
    }
}

extension PerfilViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imagePickerDes = info[.originalImage] as? UIImage{
            debugPrint(imagePickerDes)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
