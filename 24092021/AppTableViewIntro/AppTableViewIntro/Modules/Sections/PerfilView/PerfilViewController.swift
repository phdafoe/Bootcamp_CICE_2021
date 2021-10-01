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
