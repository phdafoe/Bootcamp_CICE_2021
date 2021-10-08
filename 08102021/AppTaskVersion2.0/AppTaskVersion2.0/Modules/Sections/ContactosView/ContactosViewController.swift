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
        self.arrayContactos = ContactosServerModel.stubbedContactos
        self.configuracionTV()
    }
    
    private func configuracionTV(){
        self.contactosTableView.delegate = self
        self.contactosTableView.dataSource = self
    }

}

extension ContactosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayContactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
