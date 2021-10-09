//
//  ContactosViewController.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import UIKit

class ContactosViewController: UIViewController {
    
    // MARK: - Variables locales
    var arrayContactos: [ArrayContact] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var contactosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alimentaArrayContactos()
        // Do any additional setup after loading the view.
    }

    private func alimentaArrayContactos() {
        self.title = "Contactos"
        self.arrayContactos = ContactosServerModel.stubbedContactos
        self.configuracionTV()
    }
    
    private func configuracionTV(){
        self.contactosTableView.delegate = self
        self.contactosTableView.dataSource = self
        self.contactosTableView.register(UINib(nibName: ContactosCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: ContactosCell.defaultReuseIdentifier)
    }

}

extension ContactosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayContactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactosCell = self.contactosTableView.dequeueReusableCell(withIdentifier: ContactosCell.defaultReuseIdentifier, for: indexPath) as! ContactosCell
        
        contactosCell.configuracionCelada(data: self.arrayContactos[indexPath.row])
        
        return contactosCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = self.arrayContactos[indexPath.row]
        let vc = DetalleContactoCoordinator.viewController(dvo: model)
        self.show(vc, sender: nil)
    }
    
}
