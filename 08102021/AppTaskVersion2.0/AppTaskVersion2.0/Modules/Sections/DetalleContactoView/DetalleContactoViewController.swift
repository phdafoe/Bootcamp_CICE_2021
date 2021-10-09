//
//  DetalleContactoViewController.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import UIKit

class DetalleContactoViewController: UIViewController {
    
    var dataDetail: ArrayContact?
    
    @IBOutlet weak var contactoTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTV()
        // Do any additional setup after loading the view.
    }


    private func configuracionTV() {
        self.contactoTableView.delegate = self
        self.contactoTableView.dataSource = self
        self.contactoTableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
    }

}

extension DetalleContactoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let perfilCell = self.contactoTableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
        
        if let dataDetalleDes = self.dataDetail{
            perfilCell.configuracionCelda(data: dataDetalleDes)
        }
        
        return perfilCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}
